; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82954 () Bool)

(assert start!82954)

(declare-fun res!646731 () Bool)

(declare-fun e!544939 () Bool)

(assert (=> start!82954 (=> (not res!646731) (not e!544939))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82954 (= res!646731 (validMask!0 mask!2110))))

(assert (=> start!82954 e!544939))

(assert (=> start!82954 true))

(declare-datatypes ((V!33945 0))(
  ( (V!33946 (val!10911 Int)) )
))
(declare-datatypes ((ValueCell!10379 0))(
  ( (ValueCellFull!10379 (v!13466 V!33945)) (EmptyCell!10379) )
))
(declare-datatypes ((array!59542 0))(
  ( (array!59543 (arr!28635 (Array (_ BitVec 32) ValueCell!10379)) (size!29115 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59542)

(declare-fun e!544943 () Bool)

(declare-fun array_inv!22233 (array!59542) Bool)

(assert (=> start!82954 (and (array_inv!22233 _values!1400) e!544943)))

(declare-datatypes ((array!59544 0))(
  ( (array!59545 (arr!28636 (Array (_ BitVec 32) (_ BitVec 64))) (size!29116 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59544)

(declare-fun array_inv!22234 (array!59544) Bool)

(assert (=> start!82954 (array_inv!22234 _keys!1686)))

(declare-fun b!966559 () Bool)

(declare-fun res!646728 () Bool)

(assert (=> b!966559 (=> (not res!646728) (not e!544939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59544 (_ BitVec 32)) Bool)

(assert (=> b!966559 (= res!646728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966560 () Bool)

(declare-fun res!646730 () Bool)

(assert (=> b!966560 (=> (not res!646730) (not e!544939))))

(declare-datatypes ((List!19861 0))(
  ( (Nil!19858) (Cons!19857 (h!21025 (_ BitVec 64)) (t!28216 List!19861)) )
))
(declare-fun arrayNoDuplicates!0 (array!59544 (_ BitVec 32) List!19861) Bool)

(assert (=> b!966560 (= res!646730 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19858))))

(declare-fun b!966561 () Bool)

(declare-fun e!544942 () Bool)

(declare-fun tp_is_empty!21721 () Bool)

(assert (=> b!966561 (= e!544942 tp_is_empty!21721)))

(declare-fun mapIsEmpty!34576 () Bool)

(declare-fun mapRes!34576 () Bool)

(assert (=> mapIsEmpty!34576 mapRes!34576))

(declare-fun b!966562 () Bool)

(assert (=> b!966562 (= e!544943 (and e!544942 mapRes!34576))))

(declare-fun condMapEmpty!34576 () Bool)

(declare-fun mapDefault!34576 () ValueCell!10379)

(assert (=> b!966562 (= condMapEmpty!34576 (= (arr!28635 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10379)) mapDefault!34576)))))

(declare-fun b!966563 () Bool)

(declare-fun e!544940 () Bool)

(assert (=> b!966563 (= e!544940 tp_is_empty!21721)))

(declare-fun mapNonEmpty!34576 () Bool)

(declare-fun tp!65875 () Bool)

(assert (=> mapNonEmpty!34576 (= mapRes!34576 (and tp!65875 e!544940))))

(declare-fun mapKey!34576 () (_ BitVec 32))

(declare-fun mapValue!34576 () ValueCell!10379)

(declare-fun mapRest!34576 () (Array (_ BitVec 32) ValueCell!10379))

(assert (=> mapNonEmpty!34576 (= (arr!28635 _values!1400) (store mapRest!34576 mapKey!34576 mapValue!34576))))

(declare-fun b!966564 () Bool)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!966564 (= e!544939 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29116 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29116 _keys!1686)) (bvslt i!803 #b00000000000000000000000000000000)))))

(declare-fun b!966565 () Bool)

(declare-fun res!646729 () Bool)

(assert (=> b!966565 (=> (not res!646729) (not e!544939))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!966565 (= res!646729 (and (= (size!29115 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29116 _keys!1686) (size!29115 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82954 res!646731) b!966565))

(assert (= (and b!966565 res!646729) b!966559))

(assert (= (and b!966559 res!646728) b!966560))

(assert (= (and b!966560 res!646730) b!966564))

(assert (= (and b!966562 condMapEmpty!34576) mapIsEmpty!34576))

(assert (= (and b!966562 (not condMapEmpty!34576)) mapNonEmpty!34576))

(get-info :version)

(assert (= (and mapNonEmpty!34576 ((_ is ValueCellFull!10379) mapValue!34576)) b!966563))

(assert (= (and b!966562 ((_ is ValueCellFull!10379) mapDefault!34576)) b!966561))

(assert (= start!82954 b!966562))

(declare-fun m!895963 () Bool)

(assert (=> start!82954 m!895963))

(declare-fun m!895965 () Bool)

(assert (=> start!82954 m!895965))

(declare-fun m!895967 () Bool)

(assert (=> start!82954 m!895967))

(declare-fun m!895969 () Bool)

(assert (=> b!966559 m!895969))

(declare-fun m!895971 () Bool)

(assert (=> b!966560 m!895971))

(declare-fun m!895973 () Bool)

(assert (=> mapNonEmpty!34576 m!895973))

(check-sat (not b!966560) tp_is_empty!21721 (not b!966559) (not start!82954) (not mapNonEmpty!34576))
(check-sat)
