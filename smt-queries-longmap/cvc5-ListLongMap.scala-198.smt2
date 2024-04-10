; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3820 () Bool)

(assert start!3820)

(declare-fun b_free!775 () Bool)

(declare-fun b_next!775 () Bool)

(assert (=> start!3820 (= b_free!775 (not b_next!775))))

(declare-fun tp!3736 () Bool)

(declare-fun b_and!1579 () Bool)

(assert (=> start!3820 (= tp!3736 b_and!1579)))

(declare-fun b!26723 () Bool)

(declare-fun e!17441 () Bool)

(assert (=> b!26723 (= e!17441 false)))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1331 0))(
  ( (V!1332 (val!591 Int)) )
))
(declare-datatypes ((ValueCell!365 0))(
  ( (ValueCellFull!365 (v!1677 V!1331)) (EmptyCell!365) )
))
(declare-datatypes ((array!1499 0))(
  ( (array!1500 (arr!706 (Array (_ BitVec 32) ValueCell!365)) (size!807 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1499)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1501 0))(
  ( (array!1502 (arr!707 (Array (_ BitVec 32) (_ BitVec 64))) (size!808 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1501)

(declare-fun lt!10403 () Bool)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun zeroValue!1443 () V!1331)

(declare-fun minValue!1443 () V!1331)

(declare-datatypes ((tuple2!998 0))(
  ( (tuple2!999 (_1!510 (_ BitVec 64)) (_2!510 V!1331)) )
))
(declare-datatypes ((List!598 0))(
  ( (Nil!595) (Cons!594 (h!1161 tuple2!998) (t!3285 List!598)) )
))
(declare-datatypes ((ListLongMap!575 0))(
  ( (ListLongMap!576 (toList!303 List!598)) )
))
(declare-fun contains!240 (ListLongMap!575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!133 (array!1501 array!1499 (_ BitVec 32) (_ BitVec 32) V!1331 V!1331 (_ BitVec 32) Int) ListLongMap!575)

(assert (=> b!26723 (= lt!10403 (contains!240 (getCurrentListMap!133 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304))))

(declare-fun b!26724 () Bool)

(declare-fun e!17437 () Bool)

(declare-fun tp_is_empty!1129 () Bool)

(assert (=> b!26724 (= e!17437 tp_is_empty!1129)))

(declare-fun b!26725 () Bool)

(declare-fun res!15845 () Bool)

(assert (=> b!26725 (=> (not res!15845) (not e!17441))))

(declare-datatypes ((List!599 0))(
  ( (Nil!596) (Cons!595 (h!1162 (_ BitVec 64)) (t!3286 List!599)) )
))
(declare-fun arrayNoDuplicates!0 (array!1501 (_ BitVec 32) List!599) Bool)

(assert (=> b!26725 (= res!15845 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!596))))

(declare-fun b!26726 () Bool)

(declare-fun res!15846 () Bool)

(assert (=> b!26726 (=> (not res!15846) (not e!17441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1501 (_ BitVec 32)) Bool)

(assert (=> b!26726 (= res!15846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26727 () Bool)

(declare-fun res!15847 () Bool)

(assert (=> b!26727 (=> (not res!15847) (not e!17441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26727 (= res!15847 (validKeyInArray!0 k!1304))))

(declare-fun res!15849 () Bool)

(assert (=> start!3820 (=> (not res!15849) (not e!17441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3820 (= res!15849 (validMask!0 mask!2294))))

(assert (=> start!3820 e!17441))

(assert (=> start!3820 true))

(assert (=> start!3820 tp!3736))

(declare-fun e!17439 () Bool)

(declare-fun array_inv!487 (array!1499) Bool)

(assert (=> start!3820 (and (array_inv!487 _values!1501) e!17439)))

(declare-fun array_inv!488 (array!1501) Bool)

(assert (=> start!3820 (array_inv!488 _keys!1833)))

(assert (=> start!3820 tp_is_empty!1129))

(declare-fun b!26728 () Bool)

(declare-fun mapRes!1213 () Bool)

(assert (=> b!26728 (= e!17439 (and e!17437 mapRes!1213))))

(declare-fun condMapEmpty!1213 () Bool)

(declare-fun mapDefault!1213 () ValueCell!365)

