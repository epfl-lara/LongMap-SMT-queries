; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33518 () Bool)

(assert start!33518)

(declare-fun b_free!6807 () Bool)

(declare-fun b_next!6807 () Bool)

(assert (=> start!33518 (= b_free!6807 (not b_next!6807))))

(declare-fun tp!23915 () Bool)

(declare-fun b_and!13981 () Bool)

(assert (=> start!33518 (= tp!23915 b_and!13981)))

(declare-fun b!332622 () Bool)

(declare-fun res!183244 () Bool)

(declare-fun e!204254 () Bool)

(assert (=> b!332622 (=> (not res!183244) (not e!204254))))

(declare-datatypes ((array!17115 0))(
  ( (array!17116 (arr!8091 (Array (_ BitVec 32) (_ BitVec 64))) (size!8443 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17115)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17115 (_ BitVec 32)) Bool)

(assert (=> b!332622 (= res!183244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11526 () Bool)

(declare-fun mapRes!11526 () Bool)

(declare-fun tp!23916 () Bool)

(declare-fun e!204256 () Bool)

(assert (=> mapNonEmpty!11526 (= mapRes!11526 (and tp!23916 e!204256))))

(declare-fun mapKey!11526 () (_ BitVec 32))

(declare-datatypes ((V!9989 0))(
  ( (V!9990 (val!3424 Int)) )
))
(declare-datatypes ((ValueCell!3036 0))(
  ( (ValueCellFull!3036 (v!5583 V!9989)) (EmptyCell!3036) )
))
(declare-datatypes ((array!17117 0))(
  ( (array!17118 (arr!8092 (Array (_ BitVec 32) ValueCell!3036)) (size!8444 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17117)

(declare-fun mapRest!11526 () (Array (_ BitVec 32) ValueCell!3036))

(declare-fun mapValue!11526 () ValueCell!3036)

(assert (=> mapNonEmpty!11526 (= (arr!8092 _values!1525) (store mapRest!11526 mapKey!11526 mapValue!11526))))

(declare-fun b!332623 () Bool)

(declare-fun tp_is_empty!6759 () Bool)

(assert (=> b!332623 (= e!204256 tp_is_empty!6759)))

(declare-fun b!332624 () Bool)

(assert (=> b!332624 (= e!204254 false)))

(declare-fun lt!159034 () Bool)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!9989)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!9989)

(declare-datatypes ((tuple2!4990 0))(
  ( (tuple2!4991 (_1!2506 (_ BitVec 64)) (_2!2506 V!9989)) )
))
(declare-datatypes ((List!4603 0))(
  ( (Nil!4600) (Cons!4599 (h!5455 tuple2!4990) (t!9685 List!4603)) )
))
(declare-datatypes ((ListLongMap!3903 0))(
  ( (ListLongMap!3904 (toList!1967 List!4603)) )
))
(declare-fun contains!2008 (ListLongMap!3903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1495 (array!17115 array!17117 (_ BitVec 32) (_ BitVec 32) V!9989 V!9989 (_ BitVec 32) Int) ListLongMap!3903)

(assert (=> b!332624 (= lt!159034 (contains!2008 (getCurrentListMap!1495 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348))))

(declare-fun b!332625 () Bool)

(declare-fun res!183248 () Bool)

(assert (=> b!332625 (=> (not res!183248) (not e!204254))))

(declare-datatypes ((List!4604 0))(
  ( (Nil!4601) (Cons!4600 (h!5456 (_ BitVec 64)) (t!9686 List!4604)) )
))
(declare-fun arrayNoDuplicates!0 (array!17115 (_ BitVec 32) List!4604) Bool)

(assert (=> b!332625 (= res!183248 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4601))))

(declare-fun b!332626 () Bool)

(declare-fun e!204258 () Bool)

(assert (=> b!332626 (= e!204258 tp_is_empty!6759)))

(declare-fun b!332627 () Bool)

(declare-fun e!204257 () Bool)

(assert (=> b!332627 (= e!204257 (and e!204258 mapRes!11526))))

(declare-fun condMapEmpty!11526 () Bool)

(declare-fun mapDefault!11526 () ValueCell!3036)

(assert (=> b!332627 (= condMapEmpty!11526 (= (arr!8092 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3036)) mapDefault!11526)))))

(declare-fun b!332628 () Bool)

(declare-fun res!183247 () Bool)

(assert (=> b!332628 (=> (not res!183247) (not e!204254))))

(assert (=> b!332628 (= res!183247 (and (= (size!8444 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8443 _keys!1895) (size!8444 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332629 () Bool)

(declare-fun res!183246 () Bool)

(assert (=> b!332629 (=> (not res!183246) (not e!204254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332629 (= res!183246 (validKeyInArray!0 k0!1348))))

(declare-fun res!183245 () Bool)

(assert (=> start!33518 (=> (not res!183245) (not e!204254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33518 (= res!183245 (validMask!0 mask!2385))))

(assert (=> start!33518 e!204254))

(assert (=> start!33518 true))

(assert (=> start!33518 tp_is_empty!6759))

(assert (=> start!33518 tp!23915))

(declare-fun array_inv!6028 (array!17117) Bool)

(assert (=> start!33518 (and (array_inv!6028 _values!1525) e!204257)))

(declare-fun array_inv!6029 (array!17115) Bool)

(assert (=> start!33518 (array_inv!6029 _keys!1895)))

(declare-fun mapIsEmpty!11526 () Bool)

(assert (=> mapIsEmpty!11526 mapRes!11526))

(assert (= (and start!33518 res!183245) b!332628))

(assert (= (and b!332628 res!183247) b!332622))

(assert (= (and b!332622 res!183244) b!332625))

(assert (= (and b!332625 res!183248) b!332629))

(assert (= (and b!332629 res!183246) b!332624))

(assert (= (and b!332627 condMapEmpty!11526) mapIsEmpty!11526))

(assert (= (and b!332627 (not condMapEmpty!11526)) mapNonEmpty!11526))

(get-info :version)

(assert (= (and mapNonEmpty!11526 ((_ is ValueCellFull!3036) mapValue!11526)) b!332623))

(assert (= (and b!332627 ((_ is ValueCellFull!3036) mapDefault!11526)) b!332626))

(assert (= start!33518 b!332627))

(declare-fun m!337077 () Bool)

(assert (=> b!332624 m!337077))

(assert (=> b!332624 m!337077))

(declare-fun m!337079 () Bool)

(assert (=> b!332624 m!337079))

(declare-fun m!337081 () Bool)

(assert (=> b!332622 m!337081))

(declare-fun m!337083 () Bool)

(assert (=> start!33518 m!337083))

(declare-fun m!337085 () Bool)

(assert (=> start!33518 m!337085))

(declare-fun m!337087 () Bool)

(assert (=> start!33518 m!337087))

(declare-fun m!337089 () Bool)

(assert (=> b!332629 m!337089))

(declare-fun m!337091 () Bool)

(assert (=> mapNonEmpty!11526 m!337091))

(declare-fun m!337093 () Bool)

(assert (=> b!332625 m!337093))

(check-sat (not b!332622) (not b_next!6807) (not b!332625) (not b!332629) (not start!33518) b_and!13981 tp_is_empty!6759 (not mapNonEmpty!11526) (not b!332624))
(check-sat b_and!13981 (not b_next!6807))
