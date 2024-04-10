; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4452 () Bool)

(assert start!4452)

(declare-fun b_free!1213 () Bool)

(declare-fun b_next!1213 () Bool)

(assert (=> start!4452 (= b_free!1213 (not b_next!1213))))

(declare-fun tp!5076 () Bool)

(declare-fun b_and!2035 () Bool)

(assert (=> start!4452 (= tp!5076 b_and!2035)))

(declare-fun b!34411 () Bool)

(declare-fun e!21831 () Bool)

(declare-fun tp_is_empty!1567 () Bool)

(assert (=> b!34411 (= e!21831 tp_is_empty!1567)))

(declare-fun mapNonEmpty!1897 () Bool)

(declare-fun mapRes!1897 () Bool)

(declare-fun tp!5077 () Bool)

(assert (=> mapNonEmpty!1897 (= mapRes!1897 (and tp!5077 e!21831))))

(declare-fun mapKey!1897 () (_ BitVec 32))

(declare-datatypes ((V!1915 0))(
  ( (V!1916 (val!810 Int)) )
))
(declare-datatypes ((ValueCell!584 0))(
  ( (ValueCellFull!584 (v!1905 V!1915)) (EmptyCell!584) )
))
(declare-datatypes ((array!2351 0))(
  ( (array!2352 (arr!1123 (Array (_ BitVec 32) ValueCell!584)) (size!1224 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2351)

(declare-fun mapValue!1897 () ValueCell!584)

(declare-fun mapRest!1897 () (Array (_ BitVec 32) ValueCell!584))

(assert (=> mapNonEmpty!1897 (= (arr!1123 _values!1501) (store mapRest!1897 mapKey!1897 mapValue!1897))))

(declare-fun b!34412 () Bool)

(declare-fun e!21832 () Bool)

(assert (=> b!34412 (= e!21832 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!143 0))(
  ( (MissingZero!143 (index!2694 (_ BitVec 32))) (Found!143 (index!2695 (_ BitVec 32))) (Intermediate!143 (undefined!955 Bool) (index!2696 (_ BitVec 32)) (x!6913 (_ BitVec 32))) (Undefined!143) (MissingVacant!143 (index!2697 (_ BitVec 32))) )
))
(declare-fun lt!12777 () SeekEntryResult!143)

(declare-datatypes ((array!2353 0))(
  ( (array!2354 (arr!1124 (Array (_ BitVec 32) (_ BitVec 64))) (size!1225 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2353)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2353 (_ BitVec 32)) SeekEntryResult!143)

(assert (=> b!34412 (= lt!12777 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!34413 () Bool)

(declare-fun res!20872 () Bool)

(assert (=> b!34413 (=> (not res!20872) (not e!21832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34413 (= res!20872 (validKeyInArray!0 k!1304))))

(declare-fun res!20873 () Bool)

(assert (=> start!4452 (=> (not res!20873) (not e!21832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4452 (= res!20873 (validMask!0 mask!2294))))

(assert (=> start!4452 e!21832))

(assert (=> start!4452 true))

(assert (=> start!4452 tp!5076))

(declare-fun e!21835 () Bool)

(declare-fun array_inv!793 (array!2351) Bool)

(assert (=> start!4452 (and (array_inv!793 _values!1501) e!21835)))

(declare-fun array_inv!794 (array!2353) Bool)

(assert (=> start!4452 (array_inv!794 _keys!1833)))

(assert (=> start!4452 tp_is_empty!1567))

(declare-fun b!34414 () Bool)

(declare-fun res!20868 () Bool)

(assert (=> b!34414 (=> (not res!20868) (not e!21832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2353 (_ BitVec 32)) Bool)

(assert (=> b!34414 (= res!20868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34415 () Bool)

(declare-fun res!20871 () Bool)

(assert (=> b!34415 (=> (not res!20871) (not e!21832))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1915)

(declare-fun minValue!1443 () V!1915)

(declare-datatypes ((tuple2!1318 0))(
  ( (tuple2!1319 (_1!670 (_ BitVec 64)) (_2!670 V!1915)) )
))
(declare-datatypes ((List!905 0))(
  ( (Nil!902) (Cons!901 (h!1468 tuple2!1318) (t!3610 List!905)) )
))
(declare-datatypes ((ListLongMap!895 0))(
  ( (ListLongMap!896 (toList!463 List!905)) )
))
(declare-fun contains!409 (ListLongMap!895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!287 (array!2353 array!2351 (_ BitVec 32) (_ BitVec 32) V!1915 V!1915 (_ BitVec 32) Int) ListLongMap!895)

(assert (=> b!34415 (= res!20871 (not (contains!409 (getCurrentListMap!287 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!34416 () Bool)

(declare-fun res!20874 () Bool)

(assert (=> b!34416 (=> (not res!20874) (not e!21832))))

(declare-fun arrayContainsKey!0 (array!2353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34416 (= res!20874 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34417 () Bool)

(declare-fun res!20869 () Bool)

(assert (=> b!34417 (=> (not res!20869) (not e!21832))))

(declare-datatypes ((List!906 0))(
  ( (Nil!903) (Cons!902 (h!1469 (_ BitVec 64)) (t!3611 List!906)) )
))
(declare-fun arrayNoDuplicates!0 (array!2353 (_ BitVec 32) List!906) Bool)

(assert (=> b!34417 (= res!20869 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!903))))

(declare-fun b!34418 () Bool)

(declare-fun e!21833 () Bool)

(assert (=> b!34418 (= e!21833 tp_is_empty!1567)))

(declare-fun mapIsEmpty!1897 () Bool)

(assert (=> mapIsEmpty!1897 mapRes!1897))

(declare-fun b!34419 () Bool)

(assert (=> b!34419 (= e!21835 (and e!21833 mapRes!1897))))

(declare-fun condMapEmpty!1897 () Bool)

(declare-fun mapDefault!1897 () ValueCell!584)

