; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82968 () Bool)

(assert start!82968)

(declare-fun b_free!19095 () Bool)

(declare-fun b_next!19095 () Bool)

(assert (=> start!82968 (= b_free!19095 (not b_next!19095))))

(declare-fun tp!66414 () Bool)

(declare-fun b_and!30583 () Bool)

(assert (=> start!82968 (= tp!66414 b_and!30583)))

(declare-fun b!968424 () Bool)

(declare-fun e!545741 () Bool)

(declare-fun tp_is_empty!21903 () Bool)

(assert (=> b!968424 (= e!545741 tp_is_empty!21903)))

(declare-fun b!968425 () Bool)

(declare-fun res!648340 () Bool)

(declare-fun e!545743 () Bool)

(assert (=> b!968425 (=> (not res!648340) (not e!545743))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34187 0))(
  ( (V!34188 (val!11002 Int)) )
))
(declare-datatypes ((ValueCell!10470 0))(
  ( (ValueCellFull!10470 (v!13560 V!34187)) (EmptyCell!10470) )
))
(declare-datatypes ((array!59875 0))(
  ( (array!59876 (arr!28806 (Array (_ BitVec 32) ValueCell!10470)) (size!29285 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59875)

(declare-datatypes ((array!59877 0))(
  ( (array!59878 (arr!28807 (Array (_ BitVec 32) (_ BitVec 64))) (size!29286 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59877)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!968425 (= res!648340 (and (= (size!29285 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29286 _keys!1686) (size!29285 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968426 () Bool)

(declare-fun e!545744 () Bool)

(assert (=> b!968426 (= e!545744 tp_is_empty!21903)))

(declare-fun b!968427 () Bool)

(declare-fun res!648335 () Bool)

(assert (=> b!968427 (=> (not res!648335) (not e!545743))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968427 (= res!648335 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29286 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29286 _keys!1686))))))

(declare-fun b!968428 () Bool)

(declare-fun res!648339 () Bool)

(assert (=> b!968428 (=> (not res!648339) (not e!545743))))

(assert (=> b!968428 (= res!648339 (bvsle from!2084 newFrom!159))))

(declare-fun b!968429 () Bool)

(declare-fun res!648333 () Bool)

(assert (=> b!968429 (=> (not res!648333) (not e!545743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59877 (_ BitVec 32)) Bool)

(assert (=> b!968429 (= res!648333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun zeroValue!1342 () V!34187)

(declare-fun b!968430 () Bool)

(declare-fun minValue!1342 () V!34187)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14156 0))(
  ( (tuple2!14157 (_1!7089 (_ BitVec 64)) (_2!7089 V!34187)) )
))
(declare-datatypes ((List!20001 0))(
  ( (Nil!19998) (Cons!19997 (h!21159 tuple2!14156) (t!28364 List!20001)) )
))
(declare-datatypes ((ListLongMap!12853 0))(
  ( (ListLongMap!12854 (toList!6442 List!20001)) )
))
(declare-fun contains!5543 (ListLongMap!12853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3675 (array!59877 array!59875 (_ BitVec 32) (_ BitVec 32) V!34187 V!34187 (_ BitVec 32) Int) ListLongMap!12853)

(assert (=> b!968430 (= e!545743 (not (contains!5543 (getCurrentListMap!3675 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28807 _keys!1686) i!803))))))

(declare-fun b!968431 () Bool)

(declare-fun res!648336 () Bool)

(assert (=> b!968431 (=> (not res!648336) (not e!545743))))

(assert (=> b!968431 (= res!648336 (contains!5543 (getCurrentListMap!3675 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28807 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34849 () Bool)

(declare-fun mapRes!34849 () Bool)

(assert (=> mapIsEmpty!34849 mapRes!34849))

(declare-fun b!968432 () Bool)

(declare-fun res!648334 () Bool)

(assert (=> b!968432 (=> (not res!648334) (not e!545743))))

(declare-datatypes ((List!20002 0))(
  ( (Nil!19999) (Cons!19998 (h!21160 (_ BitVec 64)) (t!28365 List!20002)) )
))
(declare-fun arrayNoDuplicates!0 (array!59877 (_ BitVec 32) List!20002) Bool)

(assert (=> b!968432 (= res!648334 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19999))))

(declare-fun b!968433 () Bool)

(declare-fun res!648338 () Bool)

(assert (=> b!968433 (=> (not res!648338) (not e!545743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968433 (= res!648338 (validKeyInArray!0 (select (arr!28807 _keys!1686) i!803)))))

(declare-fun b!968434 () Bool)

(declare-fun e!545740 () Bool)

(assert (=> b!968434 (= e!545740 (and e!545744 mapRes!34849))))

(declare-fun condMapEmpty!34849 () Bool)

(declare-fun mapDefault!34849 () ValueCell!10470)

(assert (=> b!968434 (= condMapEmpty!34849 (= (arr!28806 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10470)) mapDefault!34849)))))

(declare-fun res!648337 () Bool)

(assert (=> start!82968 (=> (not res!648337) (not e!545743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82968 (= res!648337 (validMask!0 mask!2110))))

(assert (=> start!82968 e!545743))

(assert (=> start!82968 true))

(declare-fun array_inv!22297 (array!59875) Bool)

(assert (=> start!82968 (and (array_inv!22297 _values!1400) e!545740)))

(declare-fun array_inv!22298 (array!59877) Bool)

(assert (=> start!82968 (array_inv!22298 _keys!1686)))

(assert (=> start!82968 tp!66414))

(assert (=> start!82968 tp_is_empty!21903))

(declare-fun mapNonEmpty!34849 () Bool)

(declare-fun tp!66413 () Bool)

(assert (=> mapNonEmpty!34849 (= mapRes!34849 (and tp!66413 e!545741))))

(declare-fun mapRest!34849 () (Array (_ BitVec 32) ValueCell!10470))

(declare-fun mapKey!34849 () (_ BitVec 32))

(declare-fun mapValue!34849 () ValueCell!10470)

(assert (=> mapNonEmpty!34849 (= (arr!28806 _values!1400) (store mapRest!34849 mapKey!34849 mapValue!34849))))

(assert (= (and start!82968 res!648337) b!968425))

(assert (= (and b!968425 res!648340) b!968429))

(assert (= (and b!968429 res!648333) b!968432))

(assert (= (and b!968432 res!648334) b!968427))

(assert (= (and b!968427 res!648335) b!968433))

(assert (= (and b!968433 res!648338) b!968431))

(assert (= (and b!968431 res!648336) b!968428))

(assert (= (and b!968428 res!648339) b!968430))

(assert (= (and b!968434 condMapEmpty!34849) mapIsEmpty!34849))

(assert (= (and b!968434 (not condMapEmpty!34849)) mapNonEmpty!34849))

(get-info :version)

(assert (= (and mapNonEmpty!34849 ((_ is ValueCellFull!10470) mapValue!34849)) b!968424))

(assert (= (and b!968434 ((_ is ValueCellFull!10470) mapDefault!34849)) b!968426))

(assert (= start!82968 b!968434))

(declare-fun m!896775 () Bool)

(assert (=> b!968433 m!896775))

(assert (=> b!968433 m!896775))

(declare-fun m!896777 () Bool)

(assert (=> b!968433 m!896777))

(declare-fun m!896779 () Bool)

(assert (=> b!968429 m!896779))

(declare-fun m!896781 () Bool)

(assert (=> start!82968 m!896781))

(declare-fun m!896783 () Bool)

(assert (=> start!82968 m!896783))

(declare-fun m!896785 () Bool)

(assert (=> start!82968 m!896785))

(declare-fun m!896787 () Bool)

(assert (=> b!968431 m!896787))

(assert (=> b!968431 m!896775))

(assert (=> b!968431 m!896787))

(assert (=> b!968431 m!896775))

(declare-fun m!896789 () Bool)

(assert (=> b!968431 m!896789))

(declare-fun m!896791 () Bool)

(assert (=> mapNonEmpty!34849 m!896791))

(declare-fun m!896793 () Bool)

(assert (=> b!968430 m!896793))

(assert (=> b!968430 m!896775))

(assert (=> b!968430 m!896793))

(assert (=> b!968430 m!896775))

(declare-fun m!896795 () Bool)

(assert (=> b!968430 m!896795))

(declare-fun m!896797 () Bool)

(assert (=> b!968432 m!896797))

(check-sat b_and!30583 (not b!968430) (not b!968429) (not start!82968) (not b!968432) (not b_next!19095) (not mapNonEmpty!34849) (not b!968433) (not b!968431) tp_is_empty!21903)
(check-sat b_and!30583 (not b_next!19095))
