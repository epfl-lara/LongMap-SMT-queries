; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40924 () Bool)

(assert start!40924)

(declare-fun b_free!10873 () Bool)

(declare-fun b_next!10873 () Bool)

(assert (=> start!40924 (= b_free!10873 (not b_next!10873))))

(declare-fun tp!38446 () Bool)

(declare-fun b_and!18989 () Bool)

(assert (=> start!40924 (= tp!38446 b_and!18989)))

(declare-fun b!454996 () Bool)

(declare-fun e!266037 () Bool)

(assert (=> b!454996 (= e!266037 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28217 0))(
  ( (array!28218 (arr!13552 (Array (_ BitVec 32) (_ BitVec 64))) (size!13905 (_ BitVec 32))) )
))
(declare-fun lt!206067 () array!28217)

(declare-datatypes ((V!17387 0))(
  ( (V!17388 (val!6150 Int)) )
))
(declare-fun minValue!515 () V!17387)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5762 0))(
  ( (ValueCellFull!5762 (v!8410 V!17387)) (EmptyCell!5762) )
))
(declare-datatypes ((array!28219 0))(
  ( (array!28220 (arr!13553 (Array (_ BitVec 32) ValueCell!5762)) (size!13906 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28219)

(declare-fun zeroValue!515 () V!17387)

(declare-datatypes ((tuple2!8118 0))(
  ( (tuple2!8119 (_1!4070 (_ BitVec 64)) (_2!4070 V!17387)) )
))
(declare-datatypes ((List!8178 0))(
  ( (Nil!8175) (Cons!8174 (h!9030 tuple2!8118) (t!13997 List!8178)) )
))
(declare-datatypes ((ListLongMap!7021 0))(
  ( (ListLongMap!7022 (toList!3526 List!8178)) )
))
(declare-fun lt!206068 () ListLongMap!7021)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17387)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1721 (array!28217 array!28219 (_ BitVec 32) (_ BitVec 32) V!17387 V!17387 (_ BitVec 32) Int) ListLongMap!7021)

(assert (=> b!454996 (= lt!206068 (getCurrentListMapNoExtraKeys!1721 lt!206067 (array!28220 (store (arr!13553 _values!549) i!563 (ValueCellFull!5762 v!412)) (size!13906 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206069 () ListLongMap!7021)

(declare-fun _keys!709 () array!28217)

(assert (=> b!454996 (= lt!206069 (getCurrentListMapNoExtraKeys!1721 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454997 () Bool)

(declare-fun e!266039 () Bool)

(declare-fun tp_is_empty!12211 () Bool)

(assert (=> b!454997 (= e!266039 tp_is_empty!12211)))

(declare-fun b!454998 () Bool)

(declare-fun res!271301 () Bool)

(declare-fun e!266040 () Bool)

(assert (=> b!454998 (=> (not res!271301) (not e!266040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454998 (= res!271301 (validMask!0 mask!1025))))

(declare-fun b!454999 () Bool)

(declare-fun res!271307 () Bool)

(assert (=> b!454999 (=> (not res!271307) (not e!266040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28217 (_ BitVec 32)) Bool)

(assert (=> b!454999 (= res!271307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455000 () Bool)

(declare-fun res!271303 () Bool)

(assert (=> b!455000 (=> (not res!271303) (not e!266040))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455000 (= res!271303 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455001 () Bool)

(declare-fun res!271302 () Bool)

(assert (=> b!455001 (=> (not res!271302) (not e!266040))))

(declare-datatypes ((List!8179 0))(
  ( (Nil!8176) (Cons!8175 (h!9031 (_ BitVec 64)) (t!13998 List!8179)) )
))
(declare-fun arrayNoDuplicates!0 (array!28217 (_ BitVec 32) List!8179) Bool)

(assert (=> b!455001 (= res!271302 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8176))))

(declare-fun b!455002 () Bool)

(declare-fun res!271306 () Bool)

(assert (=> b!455002 (=> (not res!271306) (not e!266037))))

(assert (=> b!455002 (= res!271306 (arrayNoDuplicates!0 lt!206067 #b00000000000000000000000000000000 Nil!8176))))

(declare-fun b!455003 () Bool)

(declare-fun res!271310 () Bool)

(assert (=> b!455003 (=> (not res!271310) (not e!266037))))

(assert (=> b!455003 (= res!271310 (bvsle from!863 i!563))))

(declare-fun b!455004 () Bool)

(declare-fun res!271304 () Bool)

(assert (=> b!455004 (=> (not res!271304) (not e!266040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455004 (= res!271304 (validKeyInArray!0 k0!794))))

(declare-fun b!455005 () Bool)

(declare-fun res!271305 () Bool)

(assert (=> b!455005 (=> (not res!271305) (not e!266040))))

(assert (=> b!455005 (= res!271305 (or (= (select (arr!13552 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13552 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455006 () Bool)

(declare-fun e!266038 () Bool)

(assert (=> b!455006 (= e!266038 tp_is_empty!12211)))

(declare-fun b!455007 () Bool)

(assert (=> b!455007 (= e!266040 e!266037)))

(declare-fun res!271300 () Bool)

(assert (=> b!455007 (=> (not res!271300) (not e!266037))))

(assert (=> b!455007 (= res!271300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206067 mask!1025))))

(assert (=> b!455007 (= lt!206067 (array!28218 (store (arr!13552 _keys!709) i!563 k0!794) (size!13905 _keys!709)))))

(declare-fun b!455008 () Bool)

(declare-fun res!271309 () Bool)

(assert (=> b!455008 (=> (not res!271309) (not e!266040))))

(assert (=> b!455008 (= res!271309 (and (= (size!13906 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13905 _keys!709) (size!13906 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455009 () Bool)

(declare-fun e!266036 () Bool)

(declare-fun mapRes!19957 () Bool)

(assert (=> b!455009 (= e!266036 (and e!266038 mapRes!19957))))

(declare-fun condMapEmpty!19957 () Bool)

(declare-fun mapDefault!19957 () ValueCell!5762)

(assert (=> b!455009 (= condMapEmpty!19957 (= (arr!13553 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5762)) mapDefault!19957)))))

(declare-fun b!455010 () Bool)

(declare-fun res!271299 () Bool)

(assert (=> b!455010 (=> (not res!271299) (not e!266040))))

(assert (=> b!455010 (= res!271299 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13905 _keys!709))))))

(declare-fun mapNonEmpty!19957 () Bool)

(declare-fun tp!38445 () Bool)

(assert (=> mapNonEmpty!19957 (= mapRes!19957 (and tp!38445 e!266039))))

(declare-fun mapValue!19957 () ValueCell!5762)

(declare-fun mapKey!19957 () (_ BitVec 32))

(declare-fun mapRest!19957 () (Array (_ BitVec 32) ValueCell!5762))

(assert (=> mapNonEmpty!19957 (= (arr!13553 _values!549) (store mapRest!19957 mapKey!19957 mapValue!19957))))

(declare-fun mapIsEmpty!19957 () Bool)

(assert (=> mapIsEmpty!19957 mapRes!19957))

(declare-fun res!271308 () Bool)

(assert (=> start!40924 (=> (not res!271308) (not e!266040))))

(assert (=> start!40924 (= res!271308 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13905 _keys!709))))))

(assert (=> start!40924 e!266040))

(assert (=> start!40924 tp_is_empty!12211))

(assert (=> start!40924 tp!38446))

(assert (=> start!40924 true))

(declare-fun array_inv!9878 (array!28219) Bool)

(assert (=> start!40924 (and (array_inv!9878 _values!549) e!266036)))

(declare-fun array_inv!9879 (array!28217) Bool)

(assert (=> start!40924 (array_inv!9879 _keys!709)))

(assert (= (and start!40924 res!271308) b!454998))

(assert (= (and b!454998 res!271301) b!455008))

(assert (= (and b!455008 res!271309) b!454999))

(assert (= (and b!454999 res!271307) b!455001))

(assert (= (and b!455001 res!271302) b!455010))

(assert (= (and b!455010 res!271299) b!455004))

(assert (= (and b!455004 res!271304) b!455005))

(assert (= (and b!455005 res!271305) b!455000))

(assert (= (and b!455000 res!271303) b!455007))

(assert (= (and b!455007 res!271300) b!455002))

(assert (= (and b!455002 res!271306) b!455003))

(assert (= (and b!455003 res!271310) b!454996))

(assert (= (and b!455009 condMapEmpty!19957) mapIsEmpty!19957))

(assert (= (and b!455009 (not condMapEmpty!19957)) mapNonEmpty!19957))

(get-info :version)

(assert (= (and mapNonEmpty!19957 ((_ is ValueCellFull!5762) mapValue!19957)) b!454997))

(assert (= (and b!455009 ((_ is ValueCellFull!5762) mapDefault!19957)) b!455006))

(assert (= start!40924 b!455009))

(declare-fun m!438377 () Bool)

(assert (=> b!455001 m!438377))

(declare-fun m!438379 () Bool)

(assert (=> mapNonEmpty!19957 m!438379))

(declare-fun m!438381 () Bool)

(assert (=> b!455005 m!438381))

(declare-fun m!438383 () Bool)

(assert (=> b!455000 m!438383))

(declare-fun m!438385 () Bool)

(assert (=> b!454996 m!438385))

(declare-fun m!438387 () Bool)

(assert (=> b!454996 m!438387))

(declare-fun m!438389 () Bool)

(assert (=> b!454996 m!438389))

(declare-fun m!438391 () Bool)

(assert (=> b!454999 m!438391))

(declare-fun m!438393 () Bool)

(assert (=> b!455002 m!438393))

(declare-fun m!438395 () Bool)

(assert (=> start!40924 m!438395))

(declare-fun m!438397 () Bool)

(assert (=> start!40924 m!438397))

(declare-fun m!438399 () Bool)

(assert (=> b!455004 m!438399))

(declare-fun m!438401 () Bool)

(assert (=> b!454998 m!438401))

(declare-fun m!438403 () Bool)

(assert (=> b!455007 m!438403))

(declare-fun m!438405 () Bool)

(assert (=> b!455007 m!438405))

(check-sat (not b!455004) (not b!454996) (not b!455002) (not start!40924) (not b!454999) (not b!454998) (not b!455000) b_and!18989 tp_is_empty!12211 (not b!455001) (not mapNonEmpty!19957) (not b_next!10873) (not b!455007))
(check-sat b_and!18989 (not b_next!10873))
