; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83052 () Bool)

(assert start!83052)

(declare-fun res!648550 () Bool)

(declare-fun e!546124 () Bool)

(assert (=> start!83052 (=> (not res!648550) (not e!546124))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83052 (= res!648550 (validMask!0 mask!2147))))

(assert (=> start!83052 e!546124))

(assert (=> start!83052 true))

(declare-datatypes ((V!34265 0))(
  ( (V!34266 (val!11031 Int)) )
))
(declare-datatypes ((ValueCell!10499 0))(
  ( (ValueCellFull!10499 (v!13589 V!34265)) (EmptyCell!10499) )
))
(declare-datatypes ((array!59924 0))(
  ( (array!59925 (arr!28826 (Array (_ BitVec 32) ValueCell!10499)) (size!29307 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59924)

(declare-fun e!546122 () Bool)

(declare-fun array_inv!22381 (array!59924) Bool)

(assert (=> start!83052 (and (array_inv!22381 _values!1425) e!546122)))

(declare-datatypes ((array!59926 0))(
  ( (array!59927 (arr!28827 (Array (_ BitVec 32) (_ BitVec 64))) (size!29308 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59926)

(declare-fun array_inv!22382 (array!59926) Bool)

(assert (=> start!83052 (array_inv!22382 _keys!1717)))

(declare-fun b!968835 () Bool)

(declare-fun e!546123 () Bool)

(declare-fun tp_is_empty!21961 () Bool)

(assert (=> b!968835 (= e!546123 tp_is_empty!21961)))

(declare-fun mapIsEmpty!34951 () Bool)

(declare-fun mapRes!34951 () Bool)

(assert (=> mapIsEmpty!34951 mapRes!34951))

(declare-fun b!968836 () Bool)

(declare-fun res!648548 () Bool)

(assert (=> b!968836 (=> (not res!648548) (not e!546124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59926 (_ BitVec 32)) Bool)

(assert (=> b!968836 (= res!648548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!34951 () Bool)

(declare-fun tp!66520 () Bool)

(declare-fun e!546125 () Bool)

(assert (=> mapNonEmpty!34951 (= mapRes!34951 (and tp!66520 e!546125))))

(declare-fun mapValue!34951 () ValueCell!10499)

(declare-fun mapRest!34951 () (Array (_ BitVec 32) ValueCell!10499))

(declare-fun mapKey!34951 () (_ BitVec 32))

(assert (=> mapNonEmpty!34951 (= (arr!28826 _values!1425) (store mapRest!34951 mapKey!34951 mapValue!34951))))

(declare-fun b!968837 () Bool)

(assert (=> b!968837 (= e!546125 tp_is_empty!21961)))

(declare-fun b!968838 () Bool)

(assert (=> b!968838 (= e!546124 false)))

(declare-fun lt!431355 () Bool)

(declare-datatypes ((List!20047 0))(
  ( (Nil!20044) (Cons!20043 (h!21205 (_ BitVec 64)) (t!28401 List!20047)) )
))
(declare-fun arrayNoDuplicates!0 (array!59926 (_ BitVec 32) List!20047) Bool)

(assert (=> b!968838 (= lt!431355 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20044))))

(declare-fun b!968839 () Bool)

(declare-fun res!648549 () Bool)

(assert (=> b!968839 (=> (not res!648549) (not e!546124))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968839 (= res!648549 (and (= (size!29307 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29308 _keys!1717) (size!29307 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968840 () Bool)

(assert (=> b!968840 (= e!546122 (and e!546123 mapRes!34951))))

(declare-fun condMapEmpty!34951 () Bool)

(declare-fun mapDefault!34951 () ValueCell!10499)

(assert (=> b!968840 (= condMapEmpty!34951 (= (arr!28826 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10499)) mapDefault!34951)))))

(assert (= (and start!83052 res!648550) b!968839))

(assert (= (and b!968839 res!648549) b!968836))

(assert (= (and b!968836 res!648548) b!968838))

(assert (= (and b!968840 condMapEmpty!34951) mapIsEmpty!34951))

(assert (= (and b!968840 (not condMapEmpty!34951)) mapNonEmpty!34951))

(get-info :version)

(assert (= (and mapNonEmpty!34951 ((_ is ValueCellFull!10499) mapValue!34951)) b!968837))

(assert (= (and b!968840 ((_ is ValueCellFull!10499) mapDefault!34951)) b!968835))

(assert (= start!83052 b!968840))

(declare-fun m!896441 () Bool)

(assert (=> start!83052 m!896441))

(declare-fun m!896443 () Bool)

(assert (=> start!83052 m!896443))

(declare-fun m!896445 () Bool)

(assert (=> start!83052 m!896445))

(declare-fun m!896447 () Bool)

(assert (=> b!968836 m!896447))

(declare-fun m!896449 () Bool)

(assert (=> mapNonEmpty!34951 m!896449))

(declare-fun m!896451 () Bool)

(assert (=> b!968838 m!896451))

(check-sat tp_is_empty!21961 (not mapNonEmpty!34951) (not start!83052) (not b!968838) (not b!968836))
(check-sat)
