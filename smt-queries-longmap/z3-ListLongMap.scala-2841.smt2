; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41012 () Bool)

(assert start!41012)

(declare-fun b_free!10947 () Bool)

(declare-fun b_next!10947 () Bool)

(assert (=> start!41012 (= b_free!10947 (not b_next!10947))))

(declare-fun tp!38668 () Bool)

(declare-fun b_and!19089 () Bool)

(assert (=> start!41012 (= tp!38668 b_and!19089)))

(declare-fun res!272832 () Bool)

(declare-fun e!266947 () Bool)

(assert (=> start!41012 (=> (not res!272832) (not e!266947))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28371 0))(
  ( (array!28372 (arr!13629 (Array (_ BitVec 32) (_ BitVec 64))) (size!13981 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28371)

(assert (=> start!41012 (= res!272832 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13981 _keys!709))))))

(assert (=> start!41012 e!266947))

(declare-fun tp_is_empty!12285 () Bool)

(assert (=> start!41012 tp_is_empty!12285))

(assert (=> start!41012 tp!38668))

(assert (=> start!41012 true))

(declare-datatypes ((V!17485 0))(
  ( (V!17486 (val!6187 Int)) )
))
(declare-datatypes ((ValueCell!5799 0))(
  ( (ValueCellFull!5799 (v!8453 V!17485)) (EmptyCell!5799) )
))
(declare-datatypes ((array!28373 0))(
  ( (array!28374 (arr!13630 (Array (_ BitVec 32) ValueCell!5799)) (size!13982 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28373)

(declare-fun e!266940 () Bool)

(declare-fun array_inv!9868 (array!28373) Bool)

(assert (=> start!41012 (and (array_inv!9868 _values!549) e!266940)))

(declare-fun array_inv!9869 (array!28371) Bool)

(assert (=> start!41012 (array_inv!9869 _keys!709)))

(declare-fun b!456996 () Bool)

(declare-fun res!272828 () Bool)

(assert (=> b!456996 (=> (not res!272828) (not e!266947))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456996 (= res!272828 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456997 () Bool)

(declare-fun res!272835 () Bool)

(declare-fun e!266945 () Bool)

(assert (=> b!456997 (=> (not res!272835) (not e!266945))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456997 (= res!272835 (bvsle from!863 i!563))))

(declare-fun b!456998 () Bool)

(declare-fun res!272829 () Bool)

(assert (=> b!456998 (=> (not res!272829) (not e!266947))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!456998 (= res!272829 (and (= (size!13982 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13981 _keys!709) (size!13982 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456999 () Bool)

(declare-fun e!266943 () Bool)

(assert (=> b!456999 (= e!266943 (bvslt from!863 (size!13982 _values!549)))))

(declare-fun b!457000 () Bool)

(declare-fun res!272825 () Bool)

(assert (=> b!457000 (=> (not res!272825) (not e!266945))))

(declare-fun lt!206718 () array!28371)

(declare-datatypes ((List!8222 0))(
  ( (Nil!8219) (Cons!8218 (h!9074 (_ BitVec 64)) (t!14050 List!8222)) )
))
(declare-fun arrayNoDuplicates!0 (array!28371 (_ BitVec 32) List!8222) Bool)

(assert (=> b!457000 (= res!272825 (arrayNoDuplicates!0 lt!206718 #b00000000000000000000000000000000 Nil!8219))))

(declare-fun mapIsEmpty!20068 () Bool)

(declare-fun mapRes!20068 () Bool)

(assert (=> mapIsEmpty!20068 mapRes!20068))

(declare-fun b!457001 () Bool)

(declare-fun res!272830 () Bool)

(assert (=> b!457001 (=> (not res!272830) (not e!266947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457001 (= res!272830 (validKeyInArray!0 k0!794))))

(declare-fun b!457002 () Bool)

(declare-fun res!272833 () Bool)

(assert (=> b!457002 (=> (not res!272833) (not e!266947))))

(assert (=> b!457002 (= res!272833 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13981 _keys!709))))))

(declare-fun b!457003 () Bool)

(declare-fun res!272836 () Bool)

(assert (=> b!457003 (=> (not res!272836) (not e!266947))))

(assert (=> b!457003 (= res!272836 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8219))))

(declare-fun b!457004 () Bool)

(declare-fun e!266946 () Bool)

(assert (=> b!457004 (= e!266946 tp_is_empty!12285)))

(declare-fun b!457005 () Bool)

(declare-fun res!272827 () Bool)

(assert (=> b!457005 (=> (not res!272827) (not e!266947))))

(assert (=> b!457005 (= res!272827 (or (= (select (arr!13629 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13629 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!20068 () Bool)

(declare-fun tp!38667 () Bool)

(assert (=> mapNonEmpty!20068 (= mapRes!20068 (and tp!38667 e!266946))))

(declare-fun mapRest!20068 () (Array (_ BitVec 32) ValueCell!5799))

(declare-fun mapValue!20068 () ValueCell!5799)

(declare-fun mapKey!20068 () (_ BitVec 32))

(assert (=> mapNonEmpty!20068 (= (arr!13630 _values!549) (store mapRest!20068 mapKey!20068 mapValue!20068))))

(declare-fun b!457006 () Bool)

(declare-fun e!266944 () Bool)

(assert (=> b!457006 (= e!266944 (not e!266943))))

(declare-fun res!272834 () Bool)

(assert (=> b!457006 (=> res!272834 e!266943)))

(assert (=> b!457006 (= res!272834 (not (validKeyInArray!0 (select (arr!13629 _keys!709) from!863))))))

(declare-fun minValue!515 () V!17485)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!206720 () array!28373)

(declare-fun zeroValue!515 () V!17485)

(declare-fun v!412 () V!17485)

(declare-datatypes ((tuple2!8148 0))(
  ( (tuple2!8149 (_1!4085 (_ BitVec 64)) (_2!4085 V!17485)) )
))
(declare-datatypes ((List!8223 0))(
  ( (Nil!8220) (Cons!8219 (h!9075 tuple2!8148) (t!14051 List!8223)) )
))
(declare-datatypes ((ListLongMap!7061 0))(
  ( (ListLongMap!7062 (toList!3546 List!8223)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1729 (array!28371 array!28373 (_ BitVec 32) (_ BitVec 32) V!17485 V!17485 (_ BitVec 32) Int) ListLongMap!7061)

(declare-fun +!1582 (ListLongMap!7061 tuple2!8148) ListLongMap!7061)

(assert (=> b!457006 (= (getCurrentListMapNoExtraKeys!1729 lt!206718 lt!206720 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1582 (getCurrentListMapNoExtraKeys!1729 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8149 k0!794 v!412)))))

(declare-datatypes ((Unit!13286 0))(
  ( (Unit!13287) )
))
(declare-fun lt!206719 () Unit!13286)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!742 (array!28371 array!28373 (_ BitVec 32) (_ BitVec 32) V!17485 V!17485 (_ BitVec 32) (_ BitVec 64) V!17485 (_ BitVec 32) Int) Unit!13286)

(assert (=> b!457006 (= lt!206719 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!742 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457007 () Bool)

(declare-fun res!272831 () Bool)

(assert (=> b!457007 (=> (not res!272831) (not e!266947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28371 (_ BitVec 32)) Bool)

(assert (=> b!457007 (= res!272831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457008 () Bool)

(declare-fun e!266942 () Bool)

(assert (=> b!457008 (= e!266940 (and e!266942 mapRes!20068))))

(declare-fun condMapEmpty!20068 () Bool)

(declare-fun mapDefault!20068 () ValueCell!5799)

(assert (=> b!457008 (= condMapEmpty!20068 (= (arr!13630 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5799)) mapDefault!20068)))))

(declare-fun b!457009 () Bool)

(declare-fun res!272824 () Bool)

(assert (=> b!457009 (=> (not res!272824) (not e!266947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457009 (= res!272824 (validMask!0 mask!1025))))

(declare-fun b!457010 () Bool)

(assert (=> b!457010 (= e!266947 e!266945)))

(declare-fun res!272837 () Bool)

(assert (=> b!457010 (=> (not res!272837) (not e!266945))))

(assert (=> b!457010 (= res!272837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206718 mask!1025))))

(assert (=> b!457010 (= lt!206718 (array!28372 (store (arr!13629 _keys!709) i!563 k0!794) (size!13981 _keys!709)))))

(declare-fun b!457011 () Bool)

(assert (=> b!457011 (= e!266942 tp_is_empty!12285)))

(declare-fun b!457012 () Bool)

(assert (=> b!457012 (= e!266945 e!266944)))

(declare-fun res!272826 () Bool)

(assert (=> b!457012 (=> (not res!272826) (not e!266944))))

(assert (=> b!457012 (= res!272826 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206716 () ListLongMap!7061)

(assert (=> b!457012 (= lt!206716 (getCurrentListMapNoExtraKeys!1729 lt!206718 lt!206720 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457012 (= lt!206720 (array!28374 (store (arr!13630 _values!549) i!563 (ValueCellFull!5799 v!412)) (size!13982 _values!549)))))

(declare-fun lt!206717 () ListLongMap!7061)

(assert (=> b!457012 (= lt!206717 (getCurrentListMapNoExtraKeys!1729 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!41012 res!272832) b!457009))

(assert (= (and b!457009 res!272824) b!456998))

(assert (= (and b!456998 res!272829) b!457007))

(assert (= (and b!457007 res!272831) b!457003))

(assert (= (and b!457003 res!272836) b!457002))

(assert (= (and b!457002 res!272833) b!457001))

(assert (= (and b!457001 res!272830) b!457005))

(assert (= (and b!457005 res!272827) b!456996))

(assert (= (and b!456996 res!272828) b!457010))

(assert (= (and b!457010 res!272837) b!457000))

(assert (= (and b!457000 res!272825) b!456997))

(assert (= (and b!456997 res!272835) b!457012))

(assert (= (and b!457012 res!272826) b!457006))

(assert (= (and b!457006 (not res!272834)) b!456999))

(assert (= (and b!457008 condMapEmpty!20068) mapIsEmpty!20068))

(assert (= (and b!457008 (not condMapEmpty!20068)) mapNonEmpty!20068))

(get-info :version)

(assert (= (and mapNonEmpty!20068 ((_ is ValueCellFull!5799) mapValue!20068)) b!457004))

(assert (= (and b!457008 ((_ is ValueCellFull!5799) mapDefault!20068)) b!457011))

(assert (= start!41012 b!457008))

(declare-fun m!440353 () Bool)

(assert (=> b!457005 m!440353))

(declare-fun m!440355 () Bool)

(assert (=> mapNonEmpty!20068 m!440355))

(declare-fun m!440357 () Bool)

(assert (=> start!41012 m!440357))

(declare-fun m!440359 () Bool)

(assert (=> start!41012 m!440359))

(declare-fun m!440361 () Bool)

(assert (=> b!457010 m!440361))

(declare-fun m!440363 () Bool)

(assert (=> b!457010 m!440363))

(declare-fun m!440365 () Bool)

(assert (=> b!457000 m!440365))

(declare-fun m!440367 () Bool)

(assert (=> b!457012 m!440367))

(declare-fun m!440369 () Bool)

(assert (=> b!457012 m!440369))

(declare-fun m!440371 () Bool)

(assert (=> b!457012 m!440371))

(declare-fun m!440373 () Bool)

(assert (=> b!457009 m!440373))

(declare-fun m!440375 () Bool)

(assert (=> b!456996 m!440375))

(declare-fun m!440377 () Bool)

(assert (=> b!457006 m!440377))

(declare-fun m!440379 () Bool)

(assert (=> b!457006 m!440379))

(assert (=> b!457006 m!440379))

(declare-fun m!440381 () Bool)

(assert (=> b!457006 m!440381))

(declare-fun m!440383 () Bool)

(assert (=> b!457006 m!440383))

(assert (=> b!457006 m!440377))

(declare-fun m!440385 () Bool)

(assert (=> b!457006 m!440385))

(declare-fun m!440387 () Bool)

(assert (=> b!457006 m!440387))

(declare-fun m!440389 () Bool)

(assert (=> b!457007 m!440389))

(declare-fun m!440391 () Bool)

(assert (=> b!457001 m!440391))

(declare-fun m!440393 () Bool)

(assert (=> b!457003 m!440393))

(check-sat (not b!457001) (not b!457006) (not b!457007) (not b!457003) (not start!41012) (not b!456996) b_and!19089 (not b_next!10947) (not b!457009) (not b!457000) tp_is_empty!12285 (not b!457010) (not b!457012) (not mapNonEmpty!20068))
(check-sat b_and!19089 (not b_next!10947))
