; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83926 () Bool)

(assert start!83926)

(declare-fun mapIsEmpty!36149 () Bool)

(declare-fun mapRes!36149 () Bool)

(assert (=> mapIsEmpty!36149 mapRes!36149))

(declare-fun b!980768 () Bool)

(declare-fun e!552844 () Bool)

(declare-fun tp_is_empty!22747 () Bool)

(assert (=> b!980768 (= e!552844 tp_is_empty!22747)))

(declare-fun b!980769 () Bool)

(declare-fun e!552842 () Bool)

(assert (=> b!980769 (= e!552842 (and e!552844 mapRes!36149))))

(declare-fun condMapEmpty!36149 () Bool)

(declare-datatypes ((V!35313 0))(
  ( (V!35314 (val!11424 Int)) )
))
(declare-datatypes ((ValueCell!10892 0))(
  ( (ValueCellFull!10892 (v!13985 V!35313)) (EmptyCell!10892) )
))
(declare-datatypes ((array!61424 0))(
  ( (array!61425 (arr!29570 (Array (_ BitVec 32) ValueCell!10892)) (size!30051 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61424)

(declare-fun mapDefault!36149 () ValueCell!10892)

(assert (=> b!980769 (= condMapEmpty!36149 (= (arr!29570 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10892)) mapDefault!36149)))))

(declare-fun b!980770 () Bool)

(declare-fun e!552845 () Bool)

(assert (=> b!980770 (= e!552845 tp_is_empty!22747)))

(declare-fun b!980771 () Bool)

(declare-fun res!656386 () Bool)

(declare-fun e!552843 () Bool)

(assert (=> b!980771 (=> (not res!656386) (not e!552843))))

(declare-datatypes ((array!61426 0))(
  ( (array!61427 (arr!29571 (Array (_ BitVec 32) (_ BitVec 64))) (size!30052 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61426)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61426 (_ BitVec 32)) Bool)

(assert (=> b!980771 (= res!656386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980772 () Bool)

(declare-fun res!656388 () Bool)

(assert (=> b!980772 (=> (not res!656388) (not e!552843))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980772 (= res!656388 (and (= (size!30051 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30052 _keys!1544) (size!30051 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980773 () Bool)

(assert (=> b!980773 (= e!552843 false)))

(declare-fun lt!435402 () Bool)

(declare-datatypes ((List!20541 0))(
  ( (Nil!20538) (Cons!20537 (h!21699 (_ BitVec 64)) (t!29215 List!20541)) )
))
(declare-fun arrayNoDuplicates!0 (array!61426 (_ BitVec 32) List!20541) Bool)

(assert (=> b!980773 (= lt!435402 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20538))))

(declare-fun res!656387 () Bool)

(assert (=> start!83926 (=> (not res!656387) (not e!552843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83926 (= res!656387 (validMask!0 mask!1948))))

(assert (=> start!83926 e!552843))

(assert (=> start!83926 true))

(declare-fun array_inv!22883 (array!61424) Bool)

(assert (=> start!83926 (and (array_inv!22883 _values!1278) e!552842)))

(declare-fun array_inv!22884 (array!61426) Bool)

(assert (=> start!83926 (array_inv!22884 _keys!1544)))

(declare-fun mapNonEmpty!36149 () Bool)

(declare-fun tp!68663 () Bool)

(assert (=> mapNonEmpty!36149 (= mapRes!36149 (and tp!68663 e!552845))))

(declare-fun mapRest!36149 () (Array (_ BitVec 32) ValueCell!10892))

(declare-fun mapValue!36149 () ValueCell!10892)

(declare-fun mapKey!36149 () (_ BitVec 32))

(assert (=> mapNonEmpty!36149 (= (arr!29570 _values!1278) (store mapRest!36149 mapKey!36149 mapValue!36149))))

(assert (= (and start!83926 res!656387) b!980772))

(assert (= (and b!980772 res!656388) b!980771))

(assert (= (and b!980771 res!656386) b!980773))

(assert (= (and b!980769 condMapEmpty!36149) mapIsEmpty!36149))

(assert (= (and b!980769 (not condMapEmpty!36149)) mapNonEmpty!36149))

(get-info :version)

(assert (= (and mapNonEmpty!36149 ((_ is ValueCellFull!10892) mapValue!36149)) b!980770))

(assert (= (and b!980769 ((_ is ValueCellFull!10892) mapDefault!36149)) b!980768))

(assert (= start!83926 b!980769))

(declare-fun m!907769 () Bool)

(assert (=> b!980771 m!907769))

(declare-fun m!907771 () Bool)

(assert (=> b!980773 m!907771))

(declare-fun m!907773 () Bool)

(assert (=> start!83926 m!907773))

(declare-fun m!907775 () Bool)

(assert (=> start!83926 m!907775))

(declare-fun m!907777 () Bool)

(assert (=> start!83926 m!907777))

(declare-fun m!907779 () Bool)

(assert (=> mapNonEmpty!36149 m!907779))

(check-sat (not mapNonEmpty!36149) (not b!980771) (not start!83926) tp_is_empty!22747 (not b!980773))
(check-sat)
