; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82612 () Bool)

(assert start!82612)

(declare-fun b_free!18745 () Bool)

(declare-fun b_next!18745 () Bool)

(assert (=> start!82612 (= b_free!18745 (not b_next!18745))))

(declare-fun tp!65354 () Bool)

(declare-fun b_and!30233 () Bool)

(assert (=> start!82612 (= tp!65354 b_and!30233)))

(declare-fun b!962865 () Bool)

(declare-fun e!542975 () Bool)

(declare-fun tp_is_empty!21547 () Bool)

(assert (=> b!962865 (= e!542975 tp_is_empty!21547)))

(declare-fun b!962866 () Bool)

(declare-fun e!542972 () Bool)

(assert (=> b!962866 (= e!542972 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!59189 0))(
  ( (array!59190 (arr!28463 (Array (_ BitVec 32) (_ BitVec 64))) (size!28942 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59189)

(declare-datatypes ((V!33713 0))(
  ( (V!33714 (val!10824 Int)) )
))
(declare-fun minValue!1342 () V!33713)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10292 0))(
  ( (ValueCellFull!10292 (v!13382 V!33713)) (EmptyCell!10292) )
))
(declare-datatypes ((array!59191 0))(
  ( (array!59192 (arr!28464 (Array (_ BitVec 32) ValueCell!10292)) (size!28943 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59191)

(declare-fun zeroValue!1342 () V!33713)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13906 0))(
  ( (tuple2!13907 (_1!6964 (_ BitVec 64)) (_2!6964 V!33713)) )
))
(declare-datatypes ((List!19755 0))(
  ( (Nil!19752) (Cons!19751 (h!20913 tuple2!13906) (t!28118 List!19755)) )
))
(declare-datatypes ((ListLongMap!12603 0))(
  ( (ListLongMap!12604 (toList!6317 List!19755)) )
))
(declare-fun contains!5420 (ListLongMap!12603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3550 (array!59189 array!59191 (_ BitVec 32) (_ BitVec 32) V!33713 V!33713 (_ BitVec 32) Int) ListLongMap!12603)

(assert (=> b!962866 (contains!5420 (getCurrentListMap!3550 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28463 _keys!1686) i!803))))

(declare-datatypes ((Unit!32219 0))(
  ( (Unit!32220) )
))
(declare-fun lt!430921 () Unit!32219)

(declare-fun lemmaInListMapFromThenInFromMinusOne!4 (array!59189 array!59191 (_ BitVec 32) (_ BitVec 32) V!33713 V!33713 (_ BitVec 32) (_ BitVec 32) Int) Unit!32219)

(assert (=> b!962866 (= lt!430921 (lemmaInListMapFromThenInFromMinusOne!4 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!962867 () Bool)

(declare-fun res!644381 () Bool)

(assert (=> b!962867 (=> (not res!644381) (not e!542972))))

(declare-datatypes ((List!19756 0))(
  ( (Nil!19753) (Cons!19752 (h!20914 (_ BitVec 64)) (t!28119 List!19756)) )
))
(declare-fun arrayNoDuplicates!0 (array!59189 (_ BitVec 32) List!19756) Bool)

(assert (=> b!962867 (= res!644381 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19753))))

(declare-fun mapNonEmpty!34315 () Bool)

(declare-fun mapRes!34315 () Bool)

(declare-fun tp!65355 () Bool)

(assert (=> mapNonEmpty!34315 (= mapRes!34315 (and tp!65355 e!542975))))

(declare-fun mapRest!34315 () (Array (_ BitVec 32) ValueCell!10292))

(declare-fun mapKey!34315 () (_ BitVec 32))

(declare-fun mapValue!34315 () ValueCell!10292)

(assert (=> mapNonEmpty!34315 (= (arr!28464 _values!1400) (store mapRest!34315 mapKey!34315 mapValue!34315))))

(declare-fun b!962868 () Bool)

(declare-fun res!644383 () Bool)

(assert (=> b!962868 (=> (not res!644383) (not e!542972))))

(assert (=> b!962868 (= res!644383 (contains!5420 (getCurrentListMap!3550 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28463 _keys!1686) i!803)))))

(declare-fun b!962869 () Bool)

(declare-fun res!644382 () Bool)

(assert (=> b!962869 (=> (not res!644382) (not e!542972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962869 (= res!644382 (validKeyInArray!0 (select (arr!28463 _keys!1686) i!803)))))

(declare-fun b!962870 () Bool)

(declare-fun res!644380 () Bool)

(assert (=> b!962870 (=> (not res!644380) (not e!542972))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962870 (= res!644380 (bvsgt from!2084 newFrom!159))))

(declare-fun b!962871 () Bool)

(declare-fun res!644378 () Bool)

(assert (=> b!962871 (=> (not res!644378) (not e!542972))))

(assert (=> b!962871 (= res!644378 (and (= (size!28943 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28942 _keys!1686) (size!28943 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34315 () Bool)

(assert (=> mapIsEmpty!34315 mapRes!34315))

(declare-fun b!962872 () Bool)

(declare-fun res!644379 () Bool)

(assert (=> b!962872 (=> (not res!644379) (not e!542972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59189 (_ BitVec 32)) Bool)

(assert (=> b!962872 (= res!644379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!644377 () Bool)

(assert (=> start!82612 (=> (not res!644377) (not e!542972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82612 (= res!644377 (validMask!0 mask!2110))))

(assert (=> start!82612 e!542972))

(assert (=> start!82612 true))

(declare-fun e!542973 () Bool)

(declare-fun array_inv!22055 (array!59191) Bool)

(assert (=> start!82612 (and (array_inv!22055 _values!1400) e!542973)))

(declare-fun array_inv!22056 (array!59189) Bool)

(assert (=> start!82612 (array_inv!22056 _keys!1686)))

(assert (=> start!82612 tp!65354))

(assert (=> start!82612 tp_is_empty!21547))

(declare-fun b!962873 () Bool)

(declare-fun res!644376 () Bool)

(assert (=> b!962873 (=> (not res!644376) (not e!542972))))

(assert (=> b!962873 (= res!644376 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28942 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28942 _keys!1686))))))

(declare-fun b!962874 () Bool)

(declare-fun e!542974 () Bool)

(assert (=> b!962874 (= e!542973 (and e!542974 mapRes!34315))))

(declare-fun condMapEmpty!34315 () Bool)

(declare-fun mapDefault!34315 () ValueCell!10292)

