; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83710 () Bool)

(assert start!83710)

(declare-fun mapIsEmpty!35825 () Bool)

(declare-fun mapRes!35825 () Bool)

(assert (=> mapIsEmpty!35825 mapRes!35825))

(declare-fun b!977423 () Bool)

(declare-fun res!654182 () Bool)

(declare-fun e!551061 () Bool)

(assert (=> b!977423 (=> (not res!654182) (not e!551061))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35025 0))(
  ( (V!35026 (val!11316 Int)) )
))
(declare-datatypes ((ValueCell!10784 0))(
  ( (ValueCellFull!10784 (v!13877 V!35025)) (EmptyCell!10784) )
))
(declare-datatypes ((array!61024 0))(
  ( (array!61025 (arr!29370 (Array (_ BitVec 32) ValueCell!10784)) (size!29851 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61024)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61026 0))(
  ( (array!61027 (arr!29371 (Array (_ BitVec 32) (_ BitVec 64))) (size!29852 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61026)

(assert (=> b!977423 (= res!654182 (and (= (size!29851 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29852 _keys!1544) (size!29851 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35825 () Bool)

(declare-fun tp!68078 () Bool)

(declare-fun e!551059 () Bool)

(assert (=> mapNonEmpty!35825 (= mapRes!35825 (and tp!68078 e!551059))))

(declare-fun mapValue!35825 () ValueCell!10784)

(declare-fun mapKey!35825 () (_ BitVec 32))

(declare-fun mapRest!35825 () (Array (_ BitVec 32) ValueCell!10784))

(assert (=> mapNonEmpty!35825 (= (arr!29370 _values!1278) (store mapRest!35825 mapKey!35825 mapValue!35825))))

(declare-fun b!977424 () Bool)

(assert (=> b!977424 (= e!551061 false)))

(declare-fun lt!433269 () Bool)

(declare-datatypes ((List!20397 0))(
  ( (Nil!20394) (Cons!20393 (h!21555 (_ BitVec 64)) (t!28903 List!20397)) )
))
(declare-fun arrayNoDuplicates!0 (array!61026 (_ BitVec 32) List!20397) Bool)

(assert (=> b!977424 (= lt!433269 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20394))))

(declare-fun res!654181 () Bool)

(assert (=> start!83710 (=> (not res!654181) (not e!551061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83710 (= res!654181 (validMask!0 mask!1948))))

(assert (=> start!83710 e!551061))

(assert (=> start!83710 true))

(declare-fun e!551062 () Bool)

(declare-fun array_inv!22743 (array!61024) Bool)

(assert (=> start!83710 (and (array_inv!22743 _values!1278) e!551062)))

(declare-fun array_inv!22744 (array!61026) Bool)

(assert (=> start!83710 (array_inv!22744 _keys!1544)))

(declare-fun b!977425 () Bool)

(declare-fun res!654183 () Bool)

(assert (=> b!977425 (=> (not res!654183) (not e!551061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61026 (_ BitVec 32)) Bool)

(assert (=> b!977425 (= res!654183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977426 () Bool)

(declare-fun tp_is_empty!22531 () Bool)

(assert (=> b!977426 (= e!551059 tp_is_empty!22531)))

(declare-fun b!977427 () Bool)

(declare-fun e!551063 () Bool)

(assert (=> b!977427 (= e!551062 (and e!551063 mapRes!35825))))

(declare-fun condMapEmpty!35825 () Bool)

(declare-fun mapDefault!35825 () ValueCell!10784)

(assert (=> b!977427 (= condMapEmpty!35825 (= (arr!29370 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10784)) mapDefault!35825)))))

(declare-fun b!977428 () Bool)

(assert (=> b!977428 (= e!551063 tp_is_empty!22531)))

(assert (= (and start!83710 res!654181) b!977423))

(assert (= (and b!977423 res!654182) b!977425))

(assert (= (and b!977425 res!654183) b!977424))

(assert (= (and b!977427 condMapEmpty!35825) mapIsEmpty!35825))

(assert (= (and b!977427 (not condMapEmpty!35825)) mapNonEmpty!35825))

(get-info :version)

(assert (= (and mapNonEmpty!35825 ((_ is ValueCellFull!10784) mapValue!35825)) b!977426))

(assert (= (and b!977427 ((_ is ValueCellFull!10784) mapDefault!35825)) b!977428))

(assert (= start!83710 b!977427))

(declare-fun m!904097 () Bool)

(assert (=> mapNonEmpty!35825 m!904097))

(declare-fun m!904099 () Bool)

(assert (=> b!977424 m!904099))

(declare-fun m!904101 () Bool)

(assert (=> start!83710 m!904101))

(declare-fun m!904103 () Bool)

(assert (=> start!83710 m!904103))

(declare-fun m!904105 () Bool)

(assert (=> start!83710 m!904105))

(declare-fun m!904107 () Bool)

(assert (=> b!977425 m!904107))

(check-sat (not start!83710) tp_is_empty!22531 (not b!977424) (not b!977425) (not mapNonEmpty!35825))
(check-sat)
