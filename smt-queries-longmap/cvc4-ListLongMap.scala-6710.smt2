; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84236 () Bool)

(assert start!84236)

(declare-fun b_free!19937 () Bool)

(declare-fun b_next!19937 () Bool)

(assert (=> start!84236 (= b_free!19937 (not b_next!19937))))

(declare-fun tp!69415 () Bool)

(declare-fun b_and!31951 () Bool)

(assert (=> start!84236 (= tp!69415 b_and!31951)))

(declare-fun b!985437 () Bool)

(declare-fun e!555480 () Bool)

(declare-fun e!555475 () Bool)

(assert (=> b!985437 (= e!555480 e!555475)))

(declare-fun res!659422 () Bool)

(assert (=> b!985437 (=> (not res!659422) (not e!555475))))

(declare-datatypes ((array!62053 0))(
  ( (array!62054 (arr!29884 (Array (_ BitVec 32) (_ BitVec 64))) (size!30363 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62053)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985437 (= res!659422 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29884 _keys!1544) from!1932))))))

(declare-datatypes ((V!35701 0))(
  ( (V!35702 (val!11570 Int)) )
))
(declare-fun lt!437244 () V!35701)

(declare-datatypes ((ValueCell!11038 0))(
  ( (ValueCellFull!11038 (v!14132 V!35701)) (EmptyCell!11038) )
))
(declare-datatypes ((array!62055 0))(
  ( (array!62056 (arr!29885 (Array (_ BitVec 32) ValueCell!11038)) (size!30364 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62055)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15511 (ValueCell!11038 V!35701) V!35701)

(declare-fun dynLambda!1838 (Int (_ BitVec 64)) V!35701)

(assert (=> b!985437 (= lt!437244 (get!15511 (select (arr!29885 _values!1278) from!1932) (dynLambda!1838 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14806 0))(
  ( (tuple2!14807 (_1!7414 (_ BitVec 64)) (_2!7414 V!35701)) )
))
(declare-datatypes ((List!20697 0))(
  ( (Nil!20694) (Cons!20693 (h!21855 tuple2!14806) (t!29578 List!20697)) )
))
(declare-datatypes ((ListLongMap!13503 0))(
  ( (ListLongMap!13504 (toList!6767 List!20697)) )
))
(declare-fun lt!437245 () ListLongMap!13503)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35701)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35701)

(declare-fun getCurrentListMapNoExtraKeys!3458 (array!62053 array!62055 (_ BitVec 32) (_ BitVec 32) V!35701 V!35701 (_ BitVec 32) Int) ListLongMap!13503)

(assert (=> b!985437 (= lt!437245 (getCurrentListMapNoExtraKeys!3458 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985438 () Bool)

(declare-fun res!659419 () Bool)

(assert (=> b!985438 (=> (not res!659419) (not e!555480))))

(declare-datatypes ((List!20698 0))(
  ( (Nil!20695) (Cons!20694 (h!21856 (_ BitVec 64)) (t!29579 List!20698)) )
))
(declare-fun arrayNoDuplicates!0 (array!62053 (_ BitVec 32) List!20698) Bool)

(assert (=> b!985438 (= res!659419 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20695))))

(declare-fun b!985439 () Bool)

(declare-fun res!659421 () Bool)

(assert (=> b!985439 (=> (not res!659421) (not e!555480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985439 (= res!659421 (validKeyInArray!0 (select (arr!29884 _keys!1544) from!1932)))))

(declare-fun b!985440 () Bool)

(declare-fun res!659416 () Bool)

(assert (=> b!985440 (=> (not res!659416) (not e!555480))))

(assert (=> b!985440 (= res!659416 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30363 _keys!1544))))))

(declare-fun mapNonEmpty!36587 () Bool)

(declare-fun mapRes!36587 () Bool)

(declare-fun tp!69414 () Bool)

(declare-fun e!555478 () Bool)

(assert (=> mapNonEmpty!36587 (= mapRes!36587 (and tp!69414 e!555478))))

(declare-fun mapValue!36587 () ValueCell!11038)

(declare-fun mapRest!36587 () (Array (_ BitVec 32) ValueCell!11038))

(declare-fun mapKey!36587 () (_ BitVec 32))

(assert (=> mapNonEmpty!36587 (= (arr!29885 _values!1278) (store mapRest!36587 mapKey!36587 mapValue!36587))))

(declare-fun b!985441 () Bool)

(declare-fun tp_is_empty!23039 () Bool)

(assert (=> b!985441 (= e!555478 tp_is_empty!23039)))

(declare-fun mapIsEmpty!36587 () Bool)

(assert (=> mapIsEmpty!36587 mapRes!36587))

(declare-fun b!985442 () Bool)

(declare-fun res!659417 () Bool)

(assert (=> b!985442 (=> (not res!659417) (not e!555480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62053 (_ BitVec 32)) Bool)

(assert (=> b!985442 (= res!659417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985443 () Bool)

(declare-fun e!555476 () Bool)

(declare-fun e!555479 () Bool)

(assert (=> b!985443 (= e!555476 (and e!555479 mapRes!36587))))

(declare-fun condMapEmpty!36587 () Bool)

(declare-fun mapDefault!36587 () ValueCell!11038)

