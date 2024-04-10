; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4458 () Bool)

(assert start!4458)

(declare-fun b_free!1219 () Bool)

(declare-fun b_next!1219 () Bool)

(assert (=> start!4458 (= b_free!1219 (not b_next!1219))))

(declare-fun tp!5095 () Bool)

(declare-fun b_and!2041 () Bool)

(assert (=> start!4458 (= tp!5095 b_and!2041)))

(declare-fun b!34501 () Bool)

(declare-fun res!20931 () Bool)

(declare-fun e!21876 () Bool)

(assert (=> b!34501 (=> (not res!20931) (not e!21876))))

(declare-datatypes ((V!1923 0))(
  ( (V!1924 (val!813 Int)) )
))
(declare-datatypes ((ValueCell!587 0))(
  ( (ValueCellFull!587 (v!1908 V!1923)) (EmptyCell!587) )
))
(declare-datatypes ((array!2363 0))(
  ( (array!2364 (arr!1129 (Array (_ BitVec 32) ValueCell!587)) (size!1230 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2363)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2365 0))(
  ( (array!2366 (arr!1130 (Array (_ BitVec 32) (_ BitVec 64))) (size!1231 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2365)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!34501 (= res!20931 (and (= (size!1230 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1231 _keys!1833) (size!1230 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1906 () Bool)

(declare-fun mapRes!1906 () Bool)

(declare-fun tp!5094 () Bool)

(declare-fun e!21880 () Bool)

(assert (=> mapNonEmpty!1906 (= mapRes!1906 (and tp!5094 e!21880))))

(declare-fun mapRest!1906 () (Array (_ BitVec 32) ValueCell!587))

(declare-fun mapValue!1906 () ValueCell!587)

(declare-fun mapKey!1906 () (_ BitVec 32))

(assert (=> mapNonEmpty!1906 (= (arr!1129 _values!1501) (store mapRest!1906 mapKey!1906 mapValue!1906))))

(declare-fun b!34502 () Bool)

(declare-fun res!20932 () Bool)

(assert (=> b!34502 (=> (not res!20932) (not e!21876))))

(declare-datatypes ((List!910 0))(
  ( (Nil!907) (Cons!906 (h!1473 (_ BitVec 64)) (t!3615 List!910)) )
))
(declare-fun arrayNoDuplicates!0 (array!2365 (_ BitVec 32) List!910) Bool)

(assert (=> b!34502 (= res!20932 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!907))))

(declare-fun mapIsEmpty!1906 () Bool)

(assert (=> mapIsEmpty!1906 mapRes!1906))

(declare-fun res!20934 () Bool)

(assert (=> start!4458 (=> (not res!20934) (not e!21876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4458 (= res!20934 (validMask!0 mask!2294))))

(assert (=> start!4458 e!21876))

(assert (=> start!4458 true))

(assert (=> start!4458 tp!5095))

(declare-fun e!21878 () Bool)

(declare-fun array_inv!799 (array!2363) Bool)

(assert (=> start!4458 (and (array_inv!799 _values!1501) e!21878)))

(declare-fun array_inv!800 (array!2365) Bool)

(assert (=> start!4458 (array_inv!800 _keys!1833)))

(declare-fun tp_is_empty!1573 () Bool)

(assert (=> start!4458 tp_is_empty!1573))

(declare-fun b!34503 () Bool)

(declare-fun res!20935 () Bool)

(assert (=> b!34503 (=> (not res!20935) (not e!21876))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34503 (= res!20935 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34504 () Bool)

(declare-fun res!20937 () Bool)

(assert (=> b!34504 (=> (not res!20937) (not e!21876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2365 (_ BitVec 32)) Bool)

(assert (=> b!34504 (= res!20937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34505 () Bool)

(declare-fun res!20936 () Bool)

(assert (=> b!34505 (=> (not res!20936) (not e!21876))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1923)

(declare-fun minValue!1443 () V!1923)

(declare-datatypes ((tuple2!1324 0))(
  ( (tuple2!1325 (_1!673 (_ BitVec 64)) (_2!673 V!1923)) )
))
(declare-datatypes ((List!911 0))(
  ( (Nil!908) (Cons!907 (h!1474 tuple2!1324) (t!3616 List!911)) )
))
(declare-datatypes ((ListLongMap!901 0))(
  ( (ListLongMap!902 (toList!466 List!911)) )
))
(declare-fun contains!412 (ListLongMap!901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!290 (array!2365 array!2363 (_ BitVec 32) (_ BitVec 32) V!1923 V!1923 (_ BitVec 32) Int) ListLongMap!901)

(assert (=> b!34505 (= res!20936 (not (contains!412 (getCurrentListMap!290 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!34506 () Bool)

(assert (=> b!34506 (= e!21876 false)))

(declare-datatypes ((SeekEntryResult!146 0))(
  ( (MissingZero!146 (index!2706 (_ BitVec 32))) (Found!146 (index!2707 (_ BitVec 32))) (Intermediate!146 (undefined!958 Bool) (index!2708 (_ BitVec 32)) (x!6924 (_ BitVec 32))) (Undefined!146) (MissingVacant!146 (index!2709 (_ BitVec 32))) )
))
(declare-fun lt!12786 () SeekEntryResult!146)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2365 (_ BitVec 32)) SeekEntryResult!146)

(assert (=> b!34506 (= lt!12786 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!34507 () Bool)

(declare-fun res!20933 () Bool)

(assert (=> b!34507 (=> (not res!20933) (not e!21876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34507 (= res!20933 (validKeyInArray!0 k!1304))))

(declare-fun b!34508 () Bool)

(assert (=> b!34508 (= e!21880 tp_is_empty!1573)))

(declare-fun b!34509 () Bool)

(declare-fun e!21879 () Bool)

(assert (=> b!34509 (= e!21879 tp_is_empty!1573)))

(declare-fun b!34510 () Bool)

(assert (=> b!34510 (= e!21878 (and e!21879 mapRes!1906))))

(declare-fun condMapEmpty!1906 () Bool)

(declare-fun mapDefault!1906 () ValueCell!587)

