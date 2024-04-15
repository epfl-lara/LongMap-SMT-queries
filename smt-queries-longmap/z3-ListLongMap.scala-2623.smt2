; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39542 () Bool)

(assert start!39542)

(declare-fun b_free!9823 () Bool)

(declare-fun b_next!9823 () Bool)

(assert (=> start!39542 (= b_free!9823 (not b_next!9823))))

(declare-fun tp!34998 () Bool)

(declare-fun b_and!17453 () Bool)

(assert (=> start!39542 (= tp!34998 b_and!17453)))

(declare-fun b!422993 () Bool)

(declare-fun res!247207 () Bool)

(declare-fun e!251496 () Bool)

(assert (=> b!422993 (=> (not res!247207) (not e!251496))))

(declare-datatypes ((array!25779 0))(
  ( (array!25780 (arr!12339 (Array (_ BitVec 32) (_ BitVec 64))) (size!12692 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25779)

(declare-datatypes ((List!7247 0))(
  ( (Nil!7244) (Cons!7243 (h!8099 (_ BitVec 64)) (t!12682 List!7247)) )
))
(declare-fun arrayNoDuplicates!0 (array!25779 (_ BitVec 32) List!7247) Bool)

(assert (=> b!422993 (= res!247207 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7244))))

(declare-fun b!422994 () Bool)

(declare-fun res!247216 () Bool)

(assert (=> b!422994 (=> (not res!247216) (not e!251496))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422994 (= res!247216 (validMask!0 mask!1025))))

(declare-fun b!422995 () Bool)

(declare-fun res!247208 () Bool)

(assert (=> b!422995 (=> (not res!247208) (not e!251496))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422995 (= res!247208 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18084 () Bool)

(declare-fun mapRes!18084 () Bool)

(declare-fun tp!34997 () Bool)

(declare-fun e!251491 () Bool)

(assert (=> mapNonEmpty!18084 (= mapRes!18084 (and tp!34997 e!251491))))

(declare-datatypes ((V!15739 0))(
  ( (V!15740 (val!5532 Int)) )
))
(declare-datatypes ((ValueCell!5144 0))(
  ( (ValueCellFull!5144 (v!7773 V!15739)) (EmptyCell!5144) )
))
(declare-fun mapValue!18084 () ValueCell!5144)

(declare-datatypes ((array!25781 0))(
  ( (array!25782 (arr!12340 (Array (_ BitVec 32) ValueCell!5144)) (size!12693 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25781)

(declare-fun mapRest!18084 () (Array (_ BitVec 32) ValueCell!5144))

(declare-fun mapKey!18084 () (_ BitVec 32))

(assert (=> mapNonEmpty!18084 (= (arr!12340 _values!549) (store mapRest!18084 mapKey!18084 mapValue!18084))))

(declare-fun b!422996 () Bool)

(declare-fun res!247215 () Bool)

(assert (=> b!422996 (=> (not res!247215) (not e!251496))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!422996 (= res!247215 (and (= (size!12693 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12692 _keys!709) (size!12693 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422997 () Bool)

(declare-fun res!247218 () Bool)

(assert (=> b!422997 (=> (not res!247218) (not e!251496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25779 (_ BitVec 32)) Bool)

(assert (=> b!422997 (= res!247218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422998 () Bool)

(declare-fun e!251494 () Bool)

(assert (=> b!422998 (= e!251494 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15739)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7254 0))(
  ( (tuple2!7255 (_1!3638 (_ BitVec 64)) (_2!3638 V!15739)) )
))
(declare-datatypes ((List!7248 0))(
  ( (Nil!7245) (Cons!7244 (h!8100 tuple2!7254) (t!12683 List!7248)) )
))
(declare-datatypes ((ListLongMap!6157 0))(
  ( (ListLongMap!6158 (toList!3094 List!7248)) )
))
(declare-fun lt!193900 () ListLongMap!6157)

(declare-fun zeroValue!515 () V!15739)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15739)

(declare-fun lt!193901 () array!25779)

(declare-fun getCurrentListMapNoExtraKeys!1302 (array!25779 array!25781 (_ BitVec 32) (_ BitVec 32) V!15739 V!15739 (_ BitVec 32) Int) ListLongMap!6157)

(assert (=> b!422998 (= lt!193900 (getCurrentListMapNoExtraKeys!1302 lt!193901 (array!25782 (store (arr!12340 _values!549) i!563 (ValueCellFull!5144 v!412)) (size!12693 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193899 () ListLongMap!6157)

(assert (=> b!422998 (= lt!193899 (getCurrentListMapNoExtraKeys!1302 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422999 () Bool)

(declare-fun res!247210 () Bool)

(assert (=> b!422999 (=> (not res!247210) (not e!251494))))

(assert (=> b!422999 (= res!247210 (bvsle from!863 i!563))))

(declare-fun b!423000 () Bool)

(declare-fun res!247213 () Bool)

(assert (=> b!423000 (=> (not res!247213) (not e!251496))))

(declare-fun arrayContainsKey!0 (array!25779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423000 (= res!247213 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423001 () Bool)

(declare-fun res!247209 () Bool)

(assert (=> b!423001 (=> (not res!247209) (not e!251496))))

(assert (=> b!423001 (= res!247209 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12692 _keys!709))))))

(declare-fun b!423002 () Bool)

(declare-fun e!251493 () Bool)

(declare-fun tp_is_empty!10975 () Bool)

(assert (=> b!423002 (= e!251493 tp_is_empty!10975)))

(declare-fun b!423003 () Bool)

(declare-fun e!251495 () Bool)

(assert (=> b!423003 (= e!251495 (and e!251493 mapRes!18084))))

(declare-fun condMapEmpty!18084 () Bool)

(declare-fun mapDefault!18084 () ValueCell!5144)

(assert (=> b!423003 (= condMapEmpty!18084 (= (arr!12340 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5144)) mapDefault!18084)))))

(declare-fun b!423004 () Bool)

(assert (=> b!423004 (= e!251496 e!251494)))

(declare-fun res!247214 () Bool)

(assert (=> b!423004 (=> (not res!247214) (not e!251494))))

(assert (=> b!423004 (= res!247214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193901 mask!1025))))

(assert (=> b!423004 (= lt!193901 (array!25780 (store (arr!12339 _keys!709) i!563 k0!794) (size!12692 _keys!709)))))

(declare-fun b!423005 () Bool)

(assert (=> b!423005 (= e!251491 tp_is_empty!10975)))

(declare-fun res!247212 () Bool)

(assert (=> start!39542 (=> (not res!247212) (not e!251496))))

(assert (=> start!39542 (= res!247212 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12692 _keys!709))))))

(assert (=> start!39542 e!251496))

(assert (=> start!39542 tp_is_empty!10975))

(assert (=> start!39542 tp!34998))

(assert (=> start!39542 true))

(declare-fun array_inv!9026 (array!25781) Bool)

(assert (=> start!39542 (and (array_inv!9026 _values!549) e!251495)))

(declare-fun array_inv!9027 (array!25779) Bool)

(assert (=> start!39542 (array_inv!9027 _keys!709)))

(declare-fun mapIsEmpty!18084 () Bool)

(assert (=> mapIsEmpty!18084 mapRes!18084))

(declare-fun b!423006 () Bool)

(declare-fun res!247217 () Bool)

(assert (=> b!423006 (=> (not res!247217) (not e!251494))))

(assert (=> b!423006 (= res!247217 (arrayNoDuplicates!0 lt!193901 #b00000000000000000000000000000000 Nil!7244))))

(declare-fun b!423007 () Bool)

(declare-fun res!247211 () Bool)

(assert (=> b!423007 (=> (not res!247211) (not e!251496))))

(assert (=> b!423007 (= res!247211 (or (= (select (arr!12339 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12339 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39542 res!247212) b!422994))

(assert (= (and b!422994 res!247216) b!422996))

(assert (= (and b!422996 res!247215) b!422997))

(assert (= (and b!422997 res!247218) b!422993))

(assert (= (and b!422993 res!247207) b!423001))

(assert (= (and b!423001 res!247209) b!422995))

(assert (= (and b!422995 res!247208) b!423007))

(assert (= (and b!423007 res!247211) b!423000))

(assert (= (and b!423000 res!247213) b!423004))

(assert (= (and b!423004 res!247214) b!423006))

(assert (= (and b!423006 res!247217) b!422999))

(assert (= (and b!422999 res!247210) b!422998))

(assert (= (and b!423003 condMapEmpty!18084) mapIsEmpty!18084))

(assert (= (and b!423003 (not condMapEmpty!18084)) mapNonEmpty!18084))

(get-info :version)

(assert (= (and mapNonEmpty!18084 ((_ is ValueCellFull!5144) mapValue!18084)) b!423005))

(assert (= (and b!423003 ((_ is ValueCellFull!5144) mapDefault!18084)) b!423002))

(assert (= start!39542 b!423003))

(declare-fun m!412071 () Bool)

(assert (=> b!422995 m!412071))

(declare-fun m!412073 () Bool)

(assert (=> start!39542 m!412073))

(declare-fun m!412075 () Bool)

(assert (=> start!39542 m!412075))

(declare-fun m!412077 () Bool)

(assert (=> b!423000 m!412077))

(declare-fun m!412079 () Bool)

(assert (=> b!423006 m!412079))

(declare-fun m!412081 () Bool)

(assert (=> b!422993 m!412081))

(declare-fun m!412083 () Bool)

(assert (=> b!422994 m!412083))

(declare-fun m!412085 () Bool)

(assert (=> mapNonEmpty!18084 m!412085))

(declare-fun m!412087 () Bool)

(assert (=> b!422997 m!412087))

(declare-fun m!412089 () Bool)

(assert (=> b!422998 m!412089))

(declare-fun m!412091 () Bool)

(assert (=> b!422998 m!412091))

(declare-fun m!412093 () Bool)

(assert (=> b!422998 m!412093))

(declare-fun m!412095 () Bool)

(assert (=> b!423007 m!412095))

(declare-fun m!412097 () Bool)

(assert (=> b!423004 m!412097))

(declare-fun m!412099 () Bool)

(assert (=> b!423004 m!412099))

(check-sat (not b!423004) (not b!423000) (not b!423006) tp_is_empty!10975 (not b!422993) (not b!422997) (not mapNonEmpty!18084) b_and!17453 (not start!39542) (not b_next!9823) (not b!422998) (not b!422994) (not b!422995))
(check-sat b_and!17453 (not b_next!9823))
