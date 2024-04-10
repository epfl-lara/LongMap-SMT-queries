; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40976 () Bool)

(assert start!40976)

(declare-fun b_free!10911 () Bool)

(declare-fun b_next!10911 () Bool)

(assert (=> start!40976 (= b_free!10911 (not b_next!10911))))

(declare-fun tp!38560 () Bool)

(declare-fun b_and!19053 () Bool)

(assert (=> start!40976 (= tp!38560 b_and!19053)))

(declare-fun b!456122 () Bool)

(declare-fun res!272117 () Bool)

(declare-fun e!266557 () Bool)

(assert (=> b!456122 (=> (not res!272117) (not e!266557))))

(declare-datatypes ((array!28301 0))(
  ( (array!28302 (arr!13594 (Array (_ BitVec 32) (_ BitVec 64))) (size!13946 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28301)

(declare-datatypes ((List!8199 0))(
  ( (Nil!8196) (Cons!8195 (h!9051 (_ BitVec 64)) (t!14027 List!8199)) )
))
(declare-fun arrayNoDuplicates!0 (array!28301 (_ BitVec 32) List!8199) Bool)

(assert (=> b!456122 (= res!272117 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8196))))

(declare-fun b!456123 () Bool)

(declare-fun res!272118 () Bool)

(assert (=> b!456123 (=> (not res!272118) (not e!266557))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28301 (_ BitVec 32)) Bool)

(assert (=> b!456123 (= res!272118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!272114 () Bool)

(assert (=> start!40976 (=> (not res!272114) (not e!266557))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40976 (= res!272114 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13946 _keys!709))))))

(assert (=> start!40976 e!266557))

(declare-fun tp_is_empty!12249 () Bool)

(assert (=> start!40976 tp_is_empty!12249))

(assert (=> start!40976 tp!38560))

(assert (=> start!40976 true))

(declare-datatypes ((V!17437 0))(
  ( (V!17438 (val!6169 Int)) )
))
(declare-datatypes ((ValueCell!5781 0))(
  ( (ValueCellFull!5781 (v!8435 V!17437)) (EmptyCell!5781) )
))
(declare-datatypes ((array!28303 0))(
  ( (array!28304 (arr!13595 (Array (_ BitVec 32) ValueCell!5781)) (size!13947 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28303)

(declare-fun e!266554 () Bool)

(declare-fun array_inv!9852 (array!28303) Bool)

(assert (=> start!40976 (and (array_inv!9852 _values!549) e!266554)))

(declare-fun array_inv!9853 (array!28301) Bool)

(assert (=> start!40976 (array_inv!9853 _keys!709)))

(declare-fun mapNonEmpty!20014 () Bool)

(declare-fun mapRes!20014 () Bool)

(declare-fun tp!38559 () Bool)

(declare-fun e!266555 () Bool)

(assert (=> mapNonEmpty!20014 (= mapRes!20014 (and tp!38559 e!266555))))

(declare-fun mapValue!20014 () ValueCell!5781)

(declare-fun mapRest!20014 () (Array (_ BitVec 32) ValueCell!5781))

(declare-fun mapKey!20014 () (_ BitVec 32))

(assert (=> mapNonEmpty!20014 (= (arr!13595 _values!549) (store mapRest!20014 mapKey!20014 mapValue!20014))))

(declare-fun b!456124 () Bool)

(declare-fun res!272112 () Bool)

(assert (=> b!456124 (=> (not res!272112) (not e!266557))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456124 (= res!272112 (or (= (select (arr!13594 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13594 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456125 () Bool)

(declare-fun res!272116 () Bool)

(declare-fun e!266552 () Bool)

(assert (=> b!456125 (=> (not res!272116) (not e!266552))))

(declare-fun lt!206473 () array!28301)

(assert (=> b!456125 (= res!272116 (arrayNoDuplicates!0 lt!206473 #b00000000000000000000000000000000 Nil!8196))))

(declare-fun b!456126 () Bool)

(declare-fun e!266556 () Bool)

(assert (=> b!456126 (= e!266556 tp_is_empty!12249)))

(declare-fun b!456127 () Bool)

(assert (=> b!456127 (= e!266552 false)))

(declare-fun minValue!515 () V!17437)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17437)

(declare-datatypes ((tuple2!8128 0))(
  ( (tuple2!8129 (_1!4075 (_ BitVec 64)) (_2!4075 V!17437)) )
))
(declare-datatypes ((List!8200 0))(
  ( (Nil!8197) (Cons!8196 (h!9052 tuple2!8128) (t!14028 List!8200)) )
))
(declare-datatypes ((ListLongMap!7041 0))(
  ( (ListLongMap!7042 (toList!3536 List!8200)) )
))
(declare-fun lt!206474 () ListLongMap!7041)

(declare-fun v!412 () V!17437)

(declare-fun getCurrentListMapNoExtraKeys!1719 (array!28301 array!28303 (_ BitVec 32) (_ BitVec 32) V!17437 V!17437 (_ BitVec 32) Int) ListLongMap!7041)

(assert (=> b!456127 (= lt!206474 (getCurrentListMapNoExtraKeys!1719 lt!206473 (array!28304 (store (arr!13595 _values!549) i!563 (ValueCellFull!5781 v!412)) (size!13947 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206472 () ListLongMap!7041)

(assert (=> b!456127 (= lt!206472 (getCurrentListMapNoExtraKeys!1719 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456128 () Bool)

(declare-fun res!272122 () Bool)

(assert (=> b!456128 (=> (not res!272122) (not e!266557))))

(assert (=> b!456128 (= res!272122 (and (= (size!13947 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13946 _keys!709) (size!13947 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456129 () Bool)

(declare-fun res!272123 () Bool)

(assert (=> b!456129 (=> (not res!272123) (not e!266557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456129 (= res!272123 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456130 () Bool)

(assert (=> b!456130 (= e!266557 e!266552)))

(declare-fun res!272115 () Bool)

(assert (=> b!456130 (=> (not res!272115) (not e!266552))))

(assert (=> b!456130 (= res!272115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206473 mask!1025))))

(assert (=> b!456130 (= lt!206473 (array!28302 (store (arr!13594 _keys!709) i!563 k0!794) (size!13946 _keys!709)))))

(declare-fun b!456131 () Bool)

(declare-fun res!272120 () Bool)

(assert (=> b!456131 (=> (not res!272120) (not e!266557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456131 (= res!272120 (validMask!0 mask!1025))))

(declare-fun b!456132 () Bool)

(declare-fun res!272119 () Bool)

(assert (=> b!456132 (=> (not res!272119) (not e!266552))))

(assert (=> b!456132 (= res!272119 (bvsle from!863 i!563))))

(declare-fun b!456133 () Bool)

(declare-fun res!272121 () Bool)

(assert (=> b!456133 (=> (not res!272121) (not e!266557))))

(assert (=> b!456133 (= res!272121 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13946 _keys!709))))))

(declare-fun b!456134 () Bool)

(assert (=> b!456134 (= e!266555 tp_is_empty!12249)))

(declare-fun mapIsEmpty!20014 () Bool)

(assert (=> mapIsEmpty!20014 mapRes!20014))

(declare-fun b!456135 () Bool)

(assert (=> b!456135 (= e!266554 (and e!266556 mapRes!20014))))

(declare-fun condMapEmpty!20014 () Bool)

(declare-fun mapDefault!20014 () ValueCell!5781)

(assert (=> b!456135 (= condMapEmpty!20014 (= (arr!13595 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5781)) mapDefault!20014)))))

(declare-fun b!456136 () Bool)

(declare-fun res!272113 () Bool)

(assert (=> b!456136 (=> (not res!272113) (not e!266557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456136 (= res!272113 (validKeyInArray!0 k0!794))))

(assert (= (and start!40976 res!272114) b!456131))

(assert (= (and b!456131 res!272120) b!456128))

(assert (= (and b!456128 res!272122) b!456123))

(assert (= (and b!456123 res!272118) b!456122))

(assert (= (and b!456122 res!272117) b!456133))

(assert (= (and b!456133 res!272121) b!456136))

(assert (= (and b!456136 res!272113) b!456124))

(assert (= (and b!456124 res!272112) b!456129))

(assert (= (and b!456129 res!272123) b!456130))

(assert (= (and b!456130 res!272115) b!456125))

(assert (= (and b!456125 res!272116) b!456132))

(assert (= (and b!456132 res!272119) b!456127))

(assert (= (and b!456135 condMapEmpty!20014) mapIsEmpty!20014))

(assert (= (and b!456135 (not condMapEmpty!20014)) mapNonEmpty!20014))

(get-info :version)

(assert (= (and mapNonEmpty!20014 ((_ is ValueCellFull!5781) mapValue!20014)) b!456134))

(assert (= (and b!456135 ((_ is ValueCellFull!5781) mapDefault!20014)) b!456126))

(assert (= start!40976 b!456135))

(declare-fun m!439681 () Bool)

(assert (=> b!456123 m!439681))

(declare-fun m!439683 () Bool)

(assert (=> b!456124 m!439683))

(declare-fun m!439685 () Bool)

(assert (=> mapNonEmpty!20014 m!439685))

(declare-fun m!439687 () Bool)

(assert (=> b!456127 m!439687))

(declare-fun m!439689 () Bool)

(assert (=> b!456127 m!439689))

(declare-fun m!439691 () Bool)

(assert (=> b!456127 m!439691))

(declare-fun m!439693 () Bool)

(assert (=> b!456131 m!439693))

(declare-fun m!439695 () Bool)

(assert (=> b!456122 m!439695))

(declare-fun m!439697 () Bool)

(assert (=> b!456136 m!439697))

(declare-fun m!439699 () Bool)

(assert (=> b!456129 m!439699))

(declare-fun m!439701 () Bool)

(assert (=> b!456125 m!439701))

(declare-fun m!439703 () Bool)

(assert (=> b!456130 m!439703))

(declare-fun m!439705 () Bool)

(assert (=> b!456130 m!439705))

(declare-fun m!439707 () Bool)

(assert (=> start!40976 m!439707))

(declare-fun m!439709 () Bool)

(assert (=> start!40976 m!439709))

(check-sat (not b_next!10911) (not b!456130) (not b!456127) (not b!456122) (not b!456123) tp_is_empty!12249 (not b!456136) (not b!456125) b_and!19053 (not mapNonEmpty!20014) (not start!40976) (not b!456129) (not b!456131))
(check-sat b_and!19053 (not b_next!10911))
