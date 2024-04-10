; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83700 () Bool)

(assert start!83700)

(declare-fun b!977410 () Bool)

(declare-fun res!654166 () Bool)

(declare-fun e!550997 () Bool)

(assert (=> b!977410 (=> (not res!654166) (not e!550997))))

(declare-datatypes ((array!61041 0))(
  ( (array!61042 (arr!29378 (Array (_ BitVec 32) (_ BitVec 64))) (size!29857 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61041)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61041 (_ BitVec 32)) Bool)

(assert (=> b!977410 (= res!654166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977411 () Bool)

(declare-fun e!551001 () Bool)

(declare-fun tp_is_empty!22503 () Bool)

(assert (=> b!977411 (= e!551001 tp_is_empty!22503)))

(declare-fun b!977412 () Bool)

(declare-fun res!654167 () Bool)

(assert (=> b!977412 (=> (not res!654167) (not e!550997))))

(declare-datatypes ((V!34987 0))(
  ( (V!34988 (val!11302 Int)) )
))
(declare-datatypes ((ValueCell!10770 0))(
  ( (ValueCellFull!10770 (v!13864 V!34987)) (EmptyCell!10770) )
))
(declare-datatypes ((array!61043 0))(
  ( (array!61044 (arr!29379 (Array (_ BitVec 32) ValueCell!10770)) (size!29858 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61043)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977412 (= res!654167 (and (= (size!29858 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29857 _keys!1544) (size!29858 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35783 () Bool)

(declare-fun mapRes!35783 () Bool)

(assert (=> mapIsEmpty!35783 mapRes!35783))

(declare-fun b!977413 () Bool)

(assert (=> b!977413 (= e!550997 false)))

(declare-fun lt!433463 () Bool)

(declare-datatypes ((List!20375 0))(
  ( (Nil!20372) (Cons!20371 (h!21533 (_ BitVec 64)) (t!28890 List!20375)) )
))
(declare-fun arrayNoDuplicates!0 (array!61041 (_ BitVec 32) List!20375) Bool)

(assert (=> b!977413 (= lt!433463 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20372))))

(declare-fun mapNonEmpty!35783 () Bool)

(declare-fun tp!68035 () Bool)

(assert (=> mapNonEmpty!35783 (= mapRes!35783 (and tp!68035 e!551001))))

(declare-fun mapKey!35783 () (_ BitVec 32))

(declare-fun mapValue!35783 () ValueCell!10770)

(declare-fun mapRest!35783 () (Array (_ BitVec 32) ValueCell!10770))

(assert (=> mapNonEmpty!35783 (= (arr!29379 _values!1278) (store mapRest!35783 mapKey!35783 mapValue!35783))))

(declare-fun res!654165 () Bool)

(assert (=> start!83700 (=> (not res!654165) (not e!550997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83700 (= res!654165 (validMask!0 mask!1948))))

(assert (=> start!83700 e!550997))

(assert (=> start!83700 true))

(declare-fun e!550999 () Bool)

(declare-fun array_inv!22713 (array!61043) Bool)

(assert (=> start!83700 (and (array_inv!22713 _values!1278) e!550999)))

(declare-fun array_inv!22714 (array!61041) Bool)

(assert (=> start!83700 (array_inv!22714 _keys!1544)))

(declare-fun b!977414 () Bool)

(declare-fun e!551000 () Bool)

(assert (=> b!977414 (= e!551000 tp_is_empty!22503)))

(declare-fun b!977415 () Bool)

(assert (=> b!977415 (= e!550999 (and e!551000 mapRes!35783))))

(declare-fun condMapEmpty!35783 () Bool)

(declare-fun mapDefault!35783 () ValueCell!10770)

(assert (=> b!977415 (= condMapEmpty!35783 (= (arr!29379 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10770)) mapDefault!35783)))))

(assert (= (and start!83700 res!654165) b!977412))

(assert (= (and b!977412 res!654167) b!977410))

(assert (= (and b!977410 res!654166) b!977413))

(assert (= (and b!977415 condMapEmpty!35783) mapIsEmpty!35783))

(assert (= (and b!977415 (not condMapEmpty!35783)) mapNonEmpty!35783))

(get-info :version)

(assert (= (and mapNonEmpty!35783 ((_ is ValueCellFull!10770) mapValue!35783)) b!977411))

(assert (= (and b!977415 ((_ is ValueCellFull!10770) mapDefault!35783)) b!977414))

(assert (= start!83700 b!977415))

(declare-fun m!904687 () Bool)

(assert (=> b!977410 m!904687))

(declare-fun m!904689 () Bool)

(assert (=> b!977413 m!904689))

(declare-fun m!904691 () Bool)

(assert (=> mapNonEmpty!35783 m!904691))

(declare-fun m!904693 () Bool)

(assert (=> start!83700 m!904693))

(declare-fun m!904695 () Bool)

(assert (=> start!83700 m!904695))

(declare-fun m!904697 () Bool)

(assert (=> start!83700 m!904697))

(check-sat tp_is_empty!22503 (not b!977410) (not mapNonEmpty!35783) (not b!977413) (not start!83700))
(check-sat)
