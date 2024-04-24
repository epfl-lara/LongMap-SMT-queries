; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39536 () Bool)

(assert start!39536)

(declare-fun b_free!9817 () Bool)

(declare-fun b_next!9817 () Bool)

(assert (=> start!39536 (= b_free!9817 (not b_next!9817))))

(declare-fun tp!34980 () Bool)

(declare-fun b_and!17487 () Bool)

(assert (=> start!39536 (= tp!34980 b_and!17487)))

(declare-fun b!423080 () Bool)

(declare-fun res!247236 () Bool)

(declare-fun e!251581 () Bool)

(assert (=> b!423080 (=> (not res!247236) (not e!251581))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423080 (= res!247236 (bvsle from!863 i!563))))

(declare-fun b!423081 () Bool)

(declare-fun res!247228 () Bool)

(declare-fun e!251580 () Bool)

(assert (=> b!423081 (=> (not res!247228) (not e!251580))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423081 (= res!247228 (validKeyInArray!0 k0!794))))

(declare-fun b!423082 () Bool)

(declare-fun res!247232 () Bool)

(assert (=> b!423082 (=> (not res!247232) (not e!251580))))

(declare-datatypes ((array!25792 0))(
  ( (array!25793 (arr!12345 (Array (_ BitVec 32) (_ BitVec 64))) (size!12697 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25792)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15731 0))(
  ( (V!15732 (val!5529 Int)) )
))
(declare-datatypes ((ValueCell!5141 0))(
  ( (ValueCellFull!5141 (v!7777 V!15731)) (EmptyCell!5141) )
))
(declare-datatypes ((array!25794 0))(
  ( (array!25795 (arr!12346 (Array (_ BitVec 32) ValueCell!5141)) (size!12698 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25794)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!423082 (= res!247232 (and (= (size!12698 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12697 _keys!709) (size!12698 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423083 () Bool)

(assert (=> b!423083 (= e!251581 false)))

(declare-fun minValue!515 () V!15731)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!194126 () array!25792)

(declare-fun zeroValue!515 () V!15731)

(declare-fun v!412 () V!15731)

(declare-datatypes ((tuple2!7144 0))(
  ( (tuple2!7145 (_1!3583 (_ BitVec 64)) (_2!3583 V!15731)) )
))
(declare-datatypes ((List!7147 0))(
  ( (Nil!7144) (Cons!7143 (h!7999 tuple2!7144) (t!12583 List!7147)) )
))
(declare-datatypes ((ListLongMap!6059 0))(
  ( (ListLongMap!6060 (toList!3045 List!7147)) )
))
(declare-fun lt!194125 () ListLongMap!6059)

(declare-fun getCurrentListMapNoExtraKeys!1291 (array!25792 array!25794 (_ BitVec 32) (_ BitVec 32) V!15731 V!15731 (_ BitVec 32) Int) ListLongMap!6059)

(assert (=> b!423083 (= lt!194125 (getCurrentListMapNoExtraKeys!1291 lt!194126 (array!25795 (store (arr!12346 _values!549) i!563 (ValueCellFull!5141 v!412)) (size!12698 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194127 () ListLongMap!6059)

(assert (=> b!423083 (= lt!194127 (getCurrentListMapNoExtraKeys!1291 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423084 () Bool)

(declare-fun res!247231 () Bool)

(assert (=> b!423084 (=> (not res!247231) (not e!251580))))

(assert (=> b!423084 (= res!247231 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12697 _keys!709))))))

(declare-fun b!423085 () Bool)

(declare-fun res!247225 () Bool)

(assert (=> b!423085 (=> (not res!247225) (not e!251581))))

(declare-datatypes ((List!7148 0))(
  ( (Nil!7145) (Cons!7144 (h!8000 (_ BitVec 64)) (t!12584 List!7148)) )
))
(declare-fun arrayNoDuplicates!0 (array!25792 (_ BitVec 32) List!7148) Bool)

(assert (=> b!423085 (= res!247225 (arrayNoDuplicates!0 lt!194126 #b00000000000000000000000000000000 Nil!7145))))

(declare-fun b!423086 () Bool)

(declare-fun res!247226 () Bool)

(assert (=> b!423086 (=> (not res!247226) (not e!251580))))

(assert (=> b!423086 (= res!247226 (or (= (select (arr!12345 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12345 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423087 () Bool)

(declare-fun res!247230 () Bool)

(assert (=> b!423087 (=> (not res!247230) (not e!251580))))

(declare-fun arrayContainsKey!0 (array!25792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423087 (= res!247230 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423088 () Bool)

(assert (=> b!423088 (= e!251580 e!251581)))

(declare-fun res!247233 () Bool)

(assert (=> b!423088 (=> (not res!247233) (not e!251581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25792 (_ BitVec 32)) Bool)

(assert (=> b!423088 (= res!247233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194126 mask!1025))))

(assert (=> b!423088 (= lt!194126 (array!25793 (store (arr!12345 _keys!709) i!563 k0!794) (size!12697 _keys!709)))))

(declare-fun mapNonEmpty!18075 () Bool)

(declare-fun mapRes!18075 () Bool)

(declare-fun tp!34979 () Bool)

(declare-fun e!251579 () Bool)

(assert (=> mapNonEmpty!18075 (= mapRes!18075 (and tp!34979 e!251579))))

(declare-fun mapKey!18075 () (_ BitVec 32))

(declare-fun mapRest!18075 () (Array (_ BitVec 32) ValueCell!5141))

(declare-fun mapValue!18075 () ValueCell!5141)

(assert (=> mapNonEmpty!18075 (= (arr!12346 _values!549) (store mapRest!18075 mapKey!18075 mapValue!18075))))

(declare-fun b!423090 () Bool)

(declare-fun e!251584 () Bool)

(declare-fun e!251582 () Bool)

(assert (=> b!423090 (= e!251584 (and e!251582 mapRes!18075))))

(declare-fun condMapEmpty!18075 () Bool)

(declare-fun mapDefault!18075 () ValueCell!5141)

(assert (=> b!423090 (= condMapEmpty!18075 (= (arr!12346 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5141)) mapDefault!18075)))))

(declare-fun mapIsEmpty!18075 () Bool)

(assert (=> mapIsEmpty!18075 mapRes!18075))

(declare-fun b!423091 () Bool)

(declare-fun tp_is_empty!10969 () Bool)

(assert (=> b!423091 (= e!251579 tp_is_empty!10969)))

(declare-fun b!423092 () Bool)

(declare-fun res!247235 () Bool)

(assert (=> b!423092 (=> (not res!247235) (not e!251580))))

(assert (=> b!423092 (= res!247235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423093 () Bool)

(declare-fun res!247227 () Bool)

(assert (=> b!423093 (=> (not res!247227) (not e!251580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423093 (= res!247227 (validMask!0 mask!1025))))

(declare-fun b!423094 () Bool)

(assert (=> b!423094 (= e!251582 tp_is_empty!10969)))

(declare-fun res!247234 () Bool)

(assert (=> start!39536 (=> (not res!247234) (not e!251580))))

(assert (=> start!39536 (= res!247234 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12697 _keys!709))))))

(assert (=> start!39536 e!251580))

(assert (=> start!39536 tp_is_empty!10969))

(assert (=> start!39536 tp!34980))

(assert (=> start!39536 true))

(declare-fun array_inv!9070 (array!25794) Bool)

(assert (=> start!39536 (and (array_inv!9070 _values!549) e!251584)))

(declare-fun array_inv!9071 (array!25792) Bool)

(assert (=> start!39536 (array_inv!9071 _keys!709)))

(declare-fun b!423089 () Bool)

(declare-fun res!247229 () Bool)

(assert (=> b!423089 (=> (not res!247229) (not e!251580))))

(assert (=> b!423089 (= res!247229 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7145))))

(assert (= (and start!39536 res!247234) b!423093))

(assert (= (and b!423093 res!247227) b!423082))

(assert (= (and b!423082 res!247232) b!423092))

(assert (= (and b!423092 res!247235) b!423089))

(assert (= (and b!423089 res!247229) b!423084))

(assert (= (and b!423084 res!247231) b!423081))

(assert (= (and b!423081 res!247228) b!423086))

(assert (= (and b!423086 res!247226) b!423087))

(assert (= (and b!423087 res!247230) b!423088))

(assert (= (and b!423088 res!247233) b!423085))

(assert (= (and b!423085 res!247225) b!423080))

(assert (= (and b!423080 res!247236) b!423083))

(assert (= (and b!423090 condMapEmpty!18075) mapIsEmpty!18075))

(assert (= (and b!423090 (not condMapEmpty!18075)) mapNonEmpty!18075))

(get-info :version)

(assert (= (and mapNonEmpty!18075 ((_ is ValueCellFull!5141) mapValue!18075)) b!423091))

(assert (= (and b!423090 ((_ is ValueCellFull!5141) mapDefault!18075)) b!423094))

(assert (= start!39536 b!423090))

(declare-fun m!412931 () Bool)

(assert (=> b!423086 m!412931))

(declare-fun m!412933 () Bool)

(assert (=> b!423087 m!412933))

(declare-fun m!412935 () Bool)

(assert (=> start!39536 m!412935))

(declare-fun m!412937 () Bool)

(assert (=> start!39536 m!412937))

(declare-fun m!412939 () Bool)

(assert (=> mapNonEmpty!18075 m!412939))

(declare-fun m!412941 () Bool)

(assert (=> b!423089 m!412941))

(declare-fun m!412943 () Bool)

(assert (=> b!423092 m!412943))

(declare-fun m!412945 () Bool)

(assert (=> b!423081 m!412945))

(declare-fun m!412947 () Bool)

(assert (=> b!423083 m!412947))

(declare-fun m!412949 () Bool)

(assert (=> b!423083 m!412949))

(declare-fun m!412951 () Bool)

(assert (=> b!423083 m!412951))

(declare-fun m!412953 () Bool)

(assert (=> b!423085 m!412953))

(declare-fun m!412955 () Bool)

(assert (=> b!423088 m!412955))

(declare-fun m!412957 () Bool)

(assert (=> b!423088 m!412957))

(declare-fun m!412959 () Bool)

(assert (=> b!423093 m!412959))

(check-sat (not b!423089) (not b_next!9817) (not b!423093) (not b!423092) b_and!17487 tp_is_empty!10969 (not start!39536) (not mapNonEmpty!18075) (not b!423083) (not b!423085) (not b!423088) (not b!423081) (not b!423087))
(check-sat b_and!17487 (not b_next!9817))
