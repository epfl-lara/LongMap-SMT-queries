; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82634 () Bool)

(assert start!82634)

(declare-fun b_free!18767 () Bool)

(declare-fun b_next!18767 () Bool)

(assert (=> start!82634 (= b_free!18767 (not b_next!18767))))

(declare-fun tp!65420 () Bool)

(declare-fun b_and!30255 () Bool)

(assert (=> start!82634 (= tp!65420 b_and!30255)))

(declare-fun b!963228 () Bool)

(declare-fun res!644643 () Bool)

(declare-fun e!543140 () Bool)

(assert (=> b!963228 (=> (not res!644643) (not e!543140))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963228 (= res!644643 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963229 () Bool)

(declare-fun res!644644 () Bool)

(assert (=> b!963229 (=> (not res!644644) (not e!543140))))

(declare-datatypes ((array!59233 0))(
  ( (array!59234 (arr!28485 (Array (_ BitVec 32) (_ BitVec 64))) (size!28964 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59233)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963229 (= res!644644 (validKeyInArray!0 (select (arr!28485 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34348 () Bool)

(declare-fun mapRes!34348 () Bool)

(declare-fun tp!65421 () Bool)

(declare-fun e!543139 () Bool)

(assert (=> mapNonEmpty!34348 (= mapRes!34348 (and tp!65421 e!543139))))

(declare-datatypes ((V!33741 0))(
  ( (V!33742 (val!10835 Int)) )
))
(declare-datatypes ((ValueCell!10303 0))(
  ( (ValueCellFull!10303 (v!13393 V!33741)) (EmptyCell!10303) )
))
(declare-fun mapRest!34348 () (Array (_ BitVec 32) ValueCell!10303))

(declare-fun mapValue!34348 () ValueCell!10303)

(declare-fun mapKey!34348 () (_ BitVec 32))

(declare-datatypes ((array!59235 0))(
  ( (array!59236 (arr!28486 (Array (_ BitVec 32) ValueCell!10303)) (size!28965 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59235)

(assert (=> mapNonEmpty!34348 (= (arr!28486 _values!1400) (store mapRest!34348 mapKey!34348 mapValue!34348))))

(declare-fun res!644646 () Bool)

(assert (=> start!82634 (=> (not res!644646) (not e!543140))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82634 (= res!644646 (validMask!0 mask!2110))))

(assert (=> start!82634 e!543140))

(assert (=> start!82634 true))

(declare-fun e!543138 () Bool)

(declare-fun array_inv!22071 (array!59235) Bool)

(assert (=> start!82634 (and (array_inv!22071 _values!1400) e!543138)))

(declare-fun array_inv!22072 (array!59233) Bool)

(assert (=> start!82634 (array_inv!22072 _keys!1686)))

(assert (=> start!82634 tp!65420))

(declare-fun tp_is_empty!21569 () Bool)

(assert (=> start!82634 tp_is_empty!21569))

(declare-fun b!963230 () Bool)

(declare-fun res!644645 () Bool)

(assert (=> b!963230 (=> (not res!644645) (not e!543140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59233 (_ BitVec 32)) Bool)

(assert (=> b!963230 (= res!644645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963231 () Bool)

(declare-fun res!644640 () Bool)

(assert (=> b!963231 (=> (not res!644640) (not e!543140))))

(declare-datatypes ((List!19770 0))(
  ( (Nil!19767) (Cons!19766 (h!20928 (_ BitVec 64)) (t!28133 List!19770)) )
))
(declare-fun arrayNoDuplicates!0 (array!59233 (_ BitVec 32) List!19770) Bool)

(assert (=> b!963231 (= res!644640 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19767))))

(declare-fun b!963232 () Bool)

(declare-fun res!644647 () Bool)

(assert (=> b!963232 (=> (not res!644647) (not e!543140))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33741)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33741)

(declare-datatypes ((tuple2!13920 0))(
  ( (tuple2!13921 (_1!6971 (_ BitVec 64)) (_2!6971 V!33741)) )
))
(declare-datatypes ((List!19771 0))(
  ( (Nil!19768) (Cons!19767 (h!20929 tuple2!13920) (t!28134 List!19771)) )
))
(declare-datatypes ((ListLongMap!12617 0))(
  ( (ListLongMap!12618 (toList!6324 List!19771)) )
))
(declare-fun contains!5427 (ListLongMap!12617 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3557 (array!59233 array!59235 (_ BitVec 32) (_ BitVec 32) V!33741 V!33741 (_ BitVec 32) Int) ListLongMap!12617)

(assert (=> b!963232 (= res!644647 (contains!5427 (getCurrentListMap!3557 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28485 _keys!1686) i!803)))))

(declare-fun b!963233 () Bool)

(declare-fun res!644641 () Bool)

(assert (=> b!963233 (=> (not res!644641) (not e!543140))))

(assert (=> b!963233 (= res!644641 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28964 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28964 _keys!1686))))))

(declare-fun b!963234 () Bool)

(declare-fun e!543136 () Bool)

(assert (=> b!963234 (= e!543138 (and e!543136 mapRes!34348))))

(declare-fun condMapEmpty!34348 () Bool)

(declare-fun mapDefault!34348 () ValueCell!10303)

