; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83730 () Bool)

(assert start!83730)

(declare-fun b!977680 () Bool)

(declare-fun res!654301 () Bool)

(declare-fun e!551224 () Bool)

(assert (=> b!977680 (=> (not res!654301) (not e!551224))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35027 0))(
  ( (V!35028 (val!11317 Int)) )
))
(declare-datatypes ((ValueCell!10785 0))(
  ( (ValueCellFull!10785 (v!13879 V!35027)) (EmptyCell!10785) )
))
(declare-datatypes ((array!61093 0))(
  ( (array!61094 (arr!29404 (Array (_ BitVec 32) ValueCell!10785)) (size!29883 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61093)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61095 0))(
  ( (array!61096 (arr!29405 (Array (_ BitVec 32) (_ BitVec 64))) (size!29884 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61095)

(assert (=> b!977680 (= res!654301 (and (= (size!29883 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29884 _keys!1544) (size!29883 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977681 () Bool)

(declare-fun res!654300 () Bool)

(assert (=> b!977681 (=> (not res!654300) (not e!551224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61095 (_ BitVec 32)) Bool)

(assert (=> b!977681 (= res!654300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977682 () Bool)

(declare-fun e!551225 () Bool)

(declare-fun tp_is_empty!22533 () Bool)

(assert (=> b!977682 (= e!551225 tp_is_empty!22533)))

(declare-fun res!654302 () Bool)

(assert (=> start!83730 (=> (not res!654302) (not e!551224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83730 (= res!654302 (validMask!0 mask!1948))))

(assert (=> start!83730 e!551224))

(assert (=> start!83730 true))

(declare-fun e!551222 () Bool)

(declare-fun array_inv!22733 (array!61093) Bool)

(assert (=> start!83730 (and (array_inv!22733 _values!1278) e!551222)))

(declare-fun array_inv!22734 (array!61095) Bool)

(assert (=> start!83730 (array_inv!22734 _keys!1544)))

(declare-fun b!977683 () Bool)

(declare-fun e!551223 () Bool)

(declare-fun mapRes!35828 () Bool)

(assert (=> b!977683 (= e!551222 (and e!551223 mapRes!35828))))

(declare-fun condMapEmpty!35828 () Bool)

(declare-fun mapDefault!35828 () ValueCell!10785)

(assert (=> b!977683 (= condMapEmpty!35828 (= (arr!29404 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10785)) mapDefault!35828)))))

(declare-fun mapIsEmpty!35828 () Bool)

(assert (=> mapIsEmpty!35828 mapRes!35828))

(declare-fun b!977684 () Bool)

(assert (=> b!977684 (= e!551223 tp_is_empty!22533)))

(declare-fun b!977685 () Bool)

(assert (=> b!977685 (= e!551224 false)))

(declare-fun lt!433508 () Bool)

(declare-datatypes ((List!20384 0))(
  ( (Nil!20381) (Cons!20380 (h!21542 (_ BitVec 64)) (t!28899 List!20384)) )
))
(declare-fun arrayNoDuplicates!0 (array!61095 (_ BitVec 32) List!20384) Bool)

(assert (=> b!977685 (= lt!433508 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20381))))

(declare-fun mapNonEmpty!35828 () Bool)

(declare-fun tp!68080 () Bool)

(assert (=> mapNonEmpty!35828 (= mapRes!35828 (and tp!68080 e!551225))))

(declare-fun mapRest!35828 () (Array (_ BitVec 32) ValueCell!10785))

(declare-fun mapKey!35828 () (_ BitVec 32))

(declare-fun mapValue!35828 () ValueCell!10785)

(assert (=> mapNonEmpty!35828 (= (arr!29404 _values!1278) (store mapRest!35828 mapKey!35828 mapValue!35828))))

(assert (= (and start!83730 res!654302) b!977680))

(assert (= (and b!977680 res!654301) b!977681))

(assert (= (and b!977681 res!654300) b!977685))

(assert (= (and b!977683 condMapEmpty!35828) mapIsEmpty!35828))

(assert (= (and b!977683 (not condMapEmpty!35828)) mapNonEmpty!35828))

(get-info :version)

(assert (= (and mapNonEmpty!35828 ((_ is ValueCellFull!10785) mapValue!35828)) b!977682))

(assert (= (and b!977683 ((_ is ValueCellFull!10785) mapDefault!35828)) b!977684))

(assert (= start!83730 b!977683))

(declare-fun m!904867 () Bool)

(assert (=> b!977681 m!904867))

(declare-fun m!904869 () Bool)

(assert (=> start!83730 m!904869))

(declare-fun m!904871 () Bool)

(assert (=> start!83730 m!904871))

(declare-fun m!904873 () Bool)

(assert (=> start!83730 m!904873))

(declare-fun m!904875 () Bool)

(assert (=> b!977685 m!904875))

(declare-fun m!904877 () Bool)

(assert (=> mapNonEmpty!35828 m!904877))

(check-sat (not start!83730) (not b!977681) (not mapNonEmpty!35828) tp_is_empty!22533 (not b!977685))
(check-sat)
