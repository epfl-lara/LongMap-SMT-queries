; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83680 () Bool)

(assert start!83680)

(declare-fun b!977153 () Bool)

(declare-fun e!550834 () Bool)

(assert (=> b!977153 (= e!550834 false)))

(declare-fun lt!433224 () Bool)

(declare-datatypes ((array!60968 0))(
  ( (array!60969 (arr!29342 (Array (_ BitVec 32) (_ BitVec 64))) (size!29823 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60968)

(declare-datatypes ((List!20386 0))(
  ( (Nil!20383) (Cons!20382 (h!21544 (_ BitVec 64)) (t!28892 List!20386)) )
))
(declare-fun arrayNoDuplicates!0 (array!60968 (_ BitVec 32) List!20386) Bool)

(assert (=> b!977153 (= lt!433224 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20383))))

(declare-fun mapIsEmpty!35780 () Bool)

(declare-fun mapRes!35780 () Bool)

(assert (=> mapIsEmpty!35780 mapRes!35780))

(declare-fun b!977154 () Bool)

(declare-fun res!654046 () Bool)

(assert (=> b!977154 (=> (not res!654046) (not e!550834))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60968 (_ BitVec 32)) Bool)

(assert (=> b!977154 (= res!654046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977155 () Bool)

(declare-fun e!550837 () Bool)

(declare-fun tp_is_empty!22501 () Bool)

(assert (=> b!977155 (= e!550837 tp_is_empty!22501)))

(declare-fun b!977156 () Bool)

(declare-fun e!550835 () Bool)

(assert (=> b!977156 (= e!550835 tp_is_empty!22501)))

(declare-fun b!977157 () Bool)

(declare-fun res!654048 () Bool)

(assert (=> b!977157 (=> (not res!654048) (not e!550834))))

(declare-datatypes ((V!34985 0))(
  ( (V!34986 (val!11301 Int)) )
))
(declare-datatypes ((ValueCell!10769 0))(
  ( (ValueCellFull!10769 (v!13862 V!34985)) (EmptyCell!10769) )
))
(declare-datatypes ((array!60970 0))(
  ( (array!60971 (arr!29343 (Array (_ BitVec 32) ValueCell!10769)) (size!29824 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60970)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977157 (= res!654048 (and (= (size!29824 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29823 _keys!1544) (size!29824 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!654047 () Bool)

(assert (=> start!83680 (=> (not res!654047) (not e!550834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83680 (= res!654047 (validMask!0 mask!1948))))

(assert (=> start!83680 e!550834))

(assert (=> start!83680 true))

(declare-fun e!550836 () Bool)

(declare-fun array_inv!22725 (array!60970) Bool)

(assert (=> start!83680 (and (array_inv!22725 _values!1278) e!550836)))

(declare-fun array_inv!22726 (array!60968) Bool)

(assert (=> start!83680 (array_inv!22726 _keys!1544)))

(declare-fun b!977158 () Bool)

(assert (=> b!977158 (= e!550836 (and e!550835 mapRes!35780))))

(declare-fun condMapEmpty!35780 () Bool)

(declare-fun mapDefault!35780 () ValueCell!10769)

(assert (=> b!977158 (= condMapEmpty!35780 (= (arr!29343 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10769)) mapDefault!35780)))))

(declare-fun mapNonEmpty!35780 () Bool)

(declare-fun tp!68033 () Bool)

(assert (=> mapNonEmpty!35780 (= mapRes!35780 (and tp!68033 e!550837))))

(declare-fun mapKey!35780 () (_ BitVec 32))

(declare-fun mapValue!35780 () ValueCell!10769)

(declare-fun mapRest!35780 () (Array (_ BitVec 32) ValueCell!10769))

(assert (=> mapNonEmpty!35780 (= (arr!29343 _values!1278) (store mapRest!35780 mapKey!35780 mapValue!35780))))

(assert (= (and start!83680 res!654047) b!977157))

(assert (= (and b!977157 res!654048) b!977154))

(assert (= (and b!977154 res!654046) b!977153))

(assert (= (and b!977158 condMapEmpty!35780) mapIsEmpty!35780))

(assert (= (and b!977158 (not condMapEmpty!35780)) mapNonEmpty!35780))

(get-info :version)

(assert (= (and mapNonEmpty!35780 ((_ is ValueCellFull!10769) mapValue!35780)) b!977155))

(assert (= (and b!977158 ((_ is ValueCellFull!10769) mapDefault!35780)) b!977156))

(assert (= start!83680 b!977158))

(declare-fun m!903917 () Bool)

(assert (=> b!977153 m!903917))

(declare-fun m!903919 () Bool)

(assert (=> b!977154 m!903919))

(declare-fun m!903921 () Bool)

(assert (=> start!83680 m!903921))

(declare-fun m!903923 () Bool)

(assert (=> start!83680 m!903923))

(declare-fun m!903925 () Bool)

(assert (=> start!83680 m!903925))

(declare-fun m!903927 () Bool)

(assert (=> mapNonEmpty!35780 m!903927))

(check-sat (not mapNonEmpty!35780) (not b!977154) (not start!83680) (not b!977153) tp_is_empty!22501)
(check-sat)
