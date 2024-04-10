; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4456 () Bool)

(assert start!4456)

(declare-fun b_free!1217 () Bool)

(declare-fun b_next!1217 () Bool)

(assert (=> start!4456 (= b_free!1217 (not b_next!1217))))

(declare-fun tp!5089 () Bool)

(declare-fun b_and!2039 () Bool)

(assert (=> start!4456 (= tp!5089 b_and!2039)))

(declare-fun b!34471 () Bool)

(declare-fun e!21861 () Bool)

(declare-fun tp_is_empty!1571 () Bool)

(assert (=> b!34471 (= e!21861 tp_is_empty!1571)))

(declare-fun b!34472 () Bool)

(declare-fun res!20916 () Bool)

(declare-fun e!21863 () Bool)

(assert (=> b!34472 (=> (not res!20916) (not e!21863))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1919 0))(
  ( (V!1920 (val!812 Int)) )
))
(declare-datatypes ((ValueCell!586 0))(
  ( (ValueCellFull!586 (v!1907 V!1919)) (EmptyCell!586) )
))
(declare-datatypes ((array!2359 0))(
  ( (array!2360 (arr!1127 (Array (_ BitVec 32) ValueCell!586)) (size!1228 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2359)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2361 0))(
  ( (array!2362 (arr!1128 (Array (_ BitVec 32) (_ BitVec 64))) (size!1229 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2361)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1919)

(declare-fun minValue!1443 () V!1919)

(declare-datatypes ((tuple2!1322 0))(
  ( (tuple2!1323 (_1!672 (_ BitVec 64)) (_2!672 V!1919)) )
))
(declare-datatypes ((List!909 0))(
  ( (Nil!906) (Cons!905 (h!1472 tuple2!1322) (t!3614 List!909)) )
))
(declare-datatypes ((ListLongMap!899 0))(
  ( (ListLongMap!900 (toList!465 List!909)) )
))
(declare-fun contains!411 (ListLongMap!899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!289 (array!2361 array!2359 (_ BitVec 32) (_ BitVec 32) V!1919 V!1919 (_ BitVec 32) Int) ListLongMap!899)

(assert (=> b!34472 (= res!20916 (not (contains!411 (getCurrentListMap!289 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun mapIsEmpty!1903 () Bool)

(declare-fun mapRes!1903 () Bool)

(assert (=> mapIsEmpty!1903 mapRes!1903))

(declare-fun mapNonEmpty!1903 () Bool)

(declare-fun tp!5088 () Bool)

(declare-fun e!21862 () Bool)

(assert (=> mapNonEmpty!1903 (= mapRes!1903 (and tp!5088 e!21862))))

(declare-fun mapValue!1903 () ValueCell!586)

(declare-fun mapRest!1903 () (Array (_ BitVec 32) ValueCell!586))

(declare-fun mapKey!1903 () (_ BitVec 32))

(assert (=> mapNonEmpty!1903 (= (arr!1127 _values!1501) (store mapRest!1903 mapKey!1903 mapValue!1903))))

(declare-fun b!34473 () Bool)

(assert (=> b!34473 (= e!21863 false)))

(declare-datatypes ((SeekEntryResult!145 0))(
  ( (MissingZero!145 (index!2702 (_ BitVec 32))) (Found!145 (index!2703 (_ BitVec 32))) (Intermediate!145 (undefined!957 Bool) (index!2704 (_ BitVec 32)) (x!6915 (_ BitVec 32))) (Undefined!145) (MissingVacant!145 (index!2705 (_ BitVec 32))) )
))
(declare-fun lt!12783 () SeekEntryResult!145)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2361 (_ BitVec 32)) SeekEntryResult!145)

(assert (=> b!34473 (= lt!12783 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun res!20914 () Bool)

(assert (=> start!4456 (=> (not res!20914) (not e!21863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4456 (= res!20914 (validMask!0 mask!2294))))

(assert (=> start!4456 e!21863))

(assert (=> start!4456 true))

(assert (=> start!4456 tp!5089))

(declare-fun e!21865 () Bool)

(declare-fun array_inv!797 (array!2359) Bool)

(assert (=> start!4456 (and (array_inv!797 _values!1501) e!21865)))

(declare-fun array_inv!798 (array!2361) Bool)

(assert (=> start!4456 (array_inv!798 _keys!1833)))

(assert (=> start!4456 tp_is_empty!1571))

(declare-fun b!34474 () Bool)

(declare-fun res!20915 () Bool)

(assert (=> b!34474 (=> (not res!20915) (not e!21863))))

(declare-fun arrayContainsKey!0 (array!2361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34474 (= res!20915 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34475 () Bool)

(declare-fun res!20910 () Bool)

(assert (=> b!34475 (=> (not res!20910) (not e!21863))))

(assert (=> b!34475 (= res!20910 (and (= (size!1228 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1229 _keys!1833) (size!1228 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34476 () Bool)

(declare-fun res!20911 () Bool)

(assert (=> b!34476 (=> (not res!20911) (not e!21863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2361 (_ BitVec 32)) Bool)

(assert (=> b!34476 (= res!20911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34477 () Bool)

(assert (=> b!34477 (= e!21862 tp_is_empty!1571)))

(declare-fun b!34478 () Bool)

(assert (=> b!34478 (= e!21865 (and e!21861 mapRes!1903))))

(declare-fun condMapEmpty!1903 () Bool)

(declare-fun mapDefault!1903 () ValueCell!586)

