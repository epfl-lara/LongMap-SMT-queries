; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82912 () Bool)

(assert start!82912)

(declare-fun b_free!18877 () Bool)

(declare-fun b_next!18877 () Bool)

(assert (=> start!82912 (= b_free!18877 (not b_next!18877))))

(declare-fun tp!65752 () Bool)

(declare-fun b_and!30375 () Bool)

(assert (=> start!82912 (= tp!65752 b_and!30375)))

(declare-fun b!965987 () Bool)

(declare-fun res!646347 () Bool)

(declare-fun e!544624 () Bool)

(assert (=> b!965987 (=> (not res!646347) (not e!544624))))

(declare-datatypes ((array!59462 0))(
  ( (array!59463 (arr!28595 (Array (_ BitVec 32) (_ BitVec 64))) (size!29075 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59462)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965987 (= res!646347 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29075 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29075 _keys!1686))))))

(declare-fun mapIsEmpty!34513 () Bool)

(declare-fun mapRes!34513 () Bool)

(assert (=> mapIsEmpty!34513 mapRes!34513))

(declare-fun b!965988 () Bool)

(declare-fun e!544625 () Bool)

(declare-fun tp_is_empty!21679 () Bool)

(assert (=> b!965988 (= e!544625 tp_is_empty!21679)))

(declare-fun b!965990 () Bool)

(declare-fun res!646346 () Bool)

(assert (=> b!965990 (=> (not res!646346) (not e!544624))))

(declare-datatypes ((List!19834 0))(
  ( (Nil!19831) (Cons!19830 (h!20998 (_ BitVec 64)) (t!28189 List!19834)) )
))
(declare-fun arrayNoDuplicates!0 (array!59462 (_ BitVec 32) List!19834) Bool)

(assert (=> b!965990 (= res!646346 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19831))))

(declare-fun b!965991 () Bool)

(declare-fun res!646348 () Bool)

(assert (=> b!965991 (=> (not res!646348) (not e!544624))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59462 (_ BitVec 32)) Bool)

(assert (=> b!965991 (= res!646348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965992 () Bool)

(declare-fun res!646345 () Bool)

(assert (=> b!965992 (=> (not res!646345) (not e!544624))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33889 0))(
  ( (V!33890 (val!10890 Int)) )
))
(declare-datatypes ((ValueCell!10358 0))(
  ( (ValueCellFull!10358 (v!13445 V!33889)) (EmptyCell!10358) )
))
(declare-datatypes ((array!59464 0))(
  ( (array!59465 (arr!28596 (Array (_ BitVec 32) ValueCell!10358)) (size!29076 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59464)

(assert (=> b!965992 (= res!646345 (and (= (size!29076 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29075 _keys!1686) (size!29076 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965993 () Bool)

(assert (=> b!965993 (= e!544624 false)))

(declare-fun minValue!1342 () V!33889)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431561 () Bool)

(declare-fun zeroValue!1342 () V!33889)

(declare-datatypes ((tuple2!13988 0))(
  ( (tuple2!13989 (_1!7005 (_ BitVec 64)) (_2!7005 V!33889)) )
))
(declare-datatypes ((List!19835 0))(
  ( (Nil!19832) (Cons!19831 (h!20999 tuple2!13988) (t!28190 List!19835)) )
))
(declare-datatypes ((ListLongMap!12687 0))(
  ( (ListLongMap!12688 (toList!6359 List!19835)) )
))
(declare-fun contains!5474 (ListLongMap!12687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3592 (array!59462 array!59464 (_ BitVec 32) (_ BitVec 32) V!33889 V!33889 (_ BitVec 32) Int) ListLongMap!12687)

(assert (=> b!965993 (= lt!431561 (contains!5474 (getCurrentListMap!3592 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28595 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34513 () Bool)

(declare-fun tp!65751 () Bool)

(declare-fun e!544627 () Bool)

(assert (=> mapNonEmpty!34513 (= mapRes!34513 (and tp!65751 e!544627))))

(declare-fun mapKey!34513 () (_ BitVec 32))

(declare-fun mapValue!34513 () ValueCell!10358)

(declare-fun mapRest!34513 () (Array (_ BitVec 32) ValueCell!10358))

(assert (=> mapNonEmpty!34513 (= (arr!28596 _values!1400) (store mapRest!34513 mapKey!34513 mapValue!34513))))

(declare-fun res!646349 () Bool)

(assert (=> start!82912 (=> (not res!646349) (not e!544624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82912 (= res!646349 (validMask!0 mask!2110))))

(assert (=> start!82912 e!544624))

(assert (=> start!82912 true))

(declare-fun e!544626 () Bool)

(declare-fun array_inv!22209 (array!59464) Bool)

(assert (=> start!82912 (and (array_inv!22209 _values!1400) e!544626)))

(declare-fun array_inv!22210 (array!59462) Bool)

(assert (=> start!82912 (array_inv!22210 _keys!1686)))

(assert (=> start!82912 tp!65752))

(assert (=> start!82912 tp_is_empty!21679))

(declare-fun b!965989 () Bool)

(assert (=> b!965989 (= e!544626 (and e!544625 mapRes!34513))))

(declare-fun condMapEmpty!34513 () Bool)

(declare-fun mapDefault!34513 () ValueCell!10358)

(assert (=> b!965989 (= condMapEmpty!34513 (= (arr!28596 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10358)) mapDefault!34513)))))

(declare-fun b!965994 () Bool)

(declare-fun res!646350 () Bool)

(assert (=> b!965994 (=> (not res!646350) (not e!544624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965994 (= res!646350 (validKeyInArray!0 (select (arr!28595 _keys!1686) i!803)))))

(declare-fun b!965995 () Bool)

(assert (=> b!965995 (= e!544627 tp_is_empty!21679)))

(assert (= (and start!82912 res!646349) b!965992))

(assert (= (and b!965992 res!646345) b!965991))

(assert (= (and b!965991 res!646348) b!965990))

(assert (= (and b!965990 res!646346) b!965987))

(assert (= (and b!965987 res!646347) b!965994))

(assert (= (and b!965994 res!646350) b!965993))

(assert (= (and b!965989 condMapEmpty!34513) mapIsEmpty!34513))

(assert (= (and b!965989 (not condMapEmpty!34513)) mapNonEmpty!34513))

(get-info :version)

(assert (= (and mapNonEmpty!34513 ((_ is ValueCellFull!10358) mapValue!34513)) b!965995))

(assert (= (and b!965989 ((_ is ValueCellFull!10358) mapDefault!34513)) b!965988))

(assert (= start!82912 b!965989))

(declare-fun m!895543 () Bool)

(assert (=> b!965990 m!895543))

(declare-fun m!895545 () Bool)

(assert (=> b!965991 m!895545))

(declare-fun m!895547 () Bool)

(assert (=> b!965993 m!895547))

(declare-fun m!895549 () Bool)

(assert (=> b!965993 m!895549))

(assert (=> b!965993 m!895547))

(assert (=> b!965993 m!895549))

(declare-fun m!895551 () Bool)

(assert (=> b!965993 m!895551))

(assert (=> b!965994 m!895549))

(assert (=> b!965994 m!895549))

(declare-fun m!895553 () Bool)

(assert (=> b!965994 m!895553))

(declare-fun m!895555 () Bool)

(assert (=> mapNonEmpty!34513 m!895555))

(declare-fun m!895557 () Bool)

(assert (=> start!82912 m!895557))

(declare-fun m!895559 () Bool)

(assert (=> start!82912 m!895559))

(declare-fun m!895561 () Bool)

(assert (=> start!82912 m!895561))

(check-sat (not b!965990) (not start!82912) (not b!965991) tp_is_empty!21679 (not b_next!18877) (not b!965993) b_and!30375 (not mapNonEmpty!34513) (not b!965994))
(check-sat b_and!30375 (not b_next!18877))
