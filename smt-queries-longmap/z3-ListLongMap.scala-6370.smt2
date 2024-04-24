; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82124 () Bool)

(assert start!82124)

(declare-fun b!956890 () Bool)

(declare-fun res!640519 () Bool)

(declare-fun e!539155 () Bool)

(assert (=> b!956890 (=> (not res!640519) (not e!539155))))

(declare-datatypes ((array!58138 0))(
  ( (array!58139 (arr!27944 (Array (_ BitVec 32) (_ BitVec 64))) (size!28424 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58138)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58138 (_ BitVec 32)) Bool)

(assert (=> b!956890 (= res!640519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956891 () Bool)

(declare-fun e!539151 () Bool)

(declare-fun tp_is_empty!20995 () Bool)

(assert (=> b!956891 (= e!539151 tp_is_empty!20995)))

(declare-fun mapIsEmpty!33454 () Bool)

(declare-fun mapRes!33454 () Bool)

(assert (=> mapIsEmpty!33454 mapRes!33454))

(declare-fun b!956892 () Bool)

(declare-fun res!640520 () Bool)

(assert (=> b!956892 (=> (not res!640520) (not e!539155))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32977 0))(
  ( (V!32978 (val!10548 Int)) )
))
(declare-datatypes ((ValueCell!10016 0))(
  ( (ValueCellFull!10016 (v!13100 V!32977)) (EmptyCell!10016) )
))
(declare-datatypes ((array!58140 0))(
  ( (array!58141 (arr!27945 (Array (_ BitVec 32) ValueCell!10016)) (size!28425 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58140)

(assert (=> b!956892 (= res!640520 (and (= (size!28425 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28424 _keys!1441) (size!28425 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956893 () Bool)

(declare-fun e!539153 () Bool)

(assert (=> b!956893 (= e!539153 tp_is_empty!20995)))

(declare-fun mapNonEmpty!33454 () Bool)

(declare-fun tp!64033 () Bool)

(assert (=> mapNonEmpty!33454 (= mapRes!33454 (and tp!64033 e!539151))))

(declare-fun mapKey!33454 () (_ BitVec 32))

(declare-fun mapRest!33454 () (Array (_ BitVec 32) ValueCell!10016))

(declare-fun mapValue!33454 () ValueCell!10016)

(assert (=> mapNonEmpty!33454 (= (arr!27945 _values!1197) (store mapRest!33454 mapKey!33454 mapValue!33454))))

(declare-fun b!956894 () Bool)

(declare-fun e!539154 () Bool)

(assert (=> b!956894 (= e!539154 (and e!539153 mapRes!33454))))

(declare-fun condMapEmpty!33454 () Bool)

(declare-fun mapDefault!33454 () ValueCell!10016)

(assert (=> b!956894 (= condMapEmpty!33454 (= (arr!27945 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10016)) mapDefault!33454)))))

(declare-fun res!640518 () Bool)

(assert (=> start!82124 (=> (not res!640518) (not e!539155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82124 (= res!640518 (validMask!0 mask!1823))))

(assert (=> start!82124 e!539155))

(assert (=> start!82124 true))

(declare-fun array_inv!21761 (array!58140) Bool)

(assert (=> start!82124 (and (array_inv!21761 _values!1197) e!539154)))

(declare-fun array_inv!21762 (array!58138) Bool)

(assert (=> start!82124 (array_inv!21762 _keys!1441)))

(declare-fun b!956895 () Bool)

(assert (=> b!956895 (= e!539155 false)))

(declare-fun lt!430431 () Bool)

(declare-datatypes ((List!19460 0))(
  ( (Nil!19457) (Cons!19456 (h!20624 (_ BitVec 64)) (t!27813 List!19460)) )
))
(declare-fun arrayNoDuplicates!0 (array!58138 (_ BitVec 32) List!19460) Bool)

(assert (=> b!956895 (= lt!430431 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19457))))

(assert (= (and start!82124 res!640518) b!956892))

(assert (= (and b!956892 res!640520) b!956890))

(assert (= (and b!956890 res!640519) b!956895))

(assert (= (and b!956894 condMapEmpty!33454) mapIsEmpty!33454))

(assert (= (and b!956894 (not condMapEmpty!33454)) mapNonEmpty!33454))

(get-info :version)

(assert (= (and mapNonEmpty!33454 ((_ is ValueCellFull!10016) mapValue!33454)) b!956891))

(assert (= (and b!956894 ((_ is ValueCellFull!10016) mapDefault!33454)) b!956893))

(assert (= start!82124 b!956894))

(declare-fun m!888711 () Bool)

(assert (=> b!956890 m!888711))

(declare-fun m!888713 () Bool)

(assert (=> mapNonEmpty!33454 m!888713))

(declare-fun m!888715 () Bool)

(assert (=> start!82124 m!888715))

(declare-fun m!888717 () Bool)

(assert (=> start!82124 m!888717))

(declare-fun m!888719 () Bool)

(assert (=> start!82124 m!888719))

(declare-fun m!888721 () Bool)

(assert (=> b!956895 m!888721))

(check-sat (not start!82124) (not b!956890) (not b!956895) (not mapNonEmpty!33454) tp_is_empty!20995)
(check-sat)
