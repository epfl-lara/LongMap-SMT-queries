; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110672 () Bool)

(assert start!110672)

(declare-fun b_free!29507 () Bool)

(declare-fun b_next!29507 () Bool)

(assert (=> start!110672 (= b_free!29507 (not b_next!29507))))

(declare-fun tp!103842 () Bool)

(declare-fun b_and!47715 () Bool)

(assert (=> start!110672 (= tp!103842 b_and!47715)))

(declare-fun b!1309547 () Bool)

(declare-fun res!869310 () Bool)

(declare-fun e!747164 () Bool)

(assert (=> b!1309547 (=> (not res!869310) (not e!747164))))

(declare-datatypes ((array!87464 0))(
  ( (array!87465 (arr!42212 (Array (_ BitVec 32) (_ BitVec 64))) (size!42762 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87464)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52085 0))(
  ( (V!52086 (val!17693 Int)) )
))
(declare-datatypes ((ValueCell!16720 0))(
  ( (ValueCellFull!16720 (v!20320 V!52085)) (EmptyCell!16720) )
))
(declare-datatypes ((array!87466 0))(
  ( (array!87467 (arr!42213 (Array (_ BitVec 32) ValueCell!16720)) (size!42763 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87466)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309547 (= res!869310 (and (= (size!42763 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42762 _keys!1628) (size!42763 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!869309 () Bool)

(assert (=> start!110672 (=> (not res!869309) (not e!747164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110672 (= res!869309 (validMask!0 mask!2040))))

(assert (=> start!110672 e!747164))

(assert (=> start!110672 tp!103842))

(declare-fun array_inv!31899 (array!87464) Bool)

(assert (=> start!110672 (array_inv!31899 _keys!1628)))

(assert (=> start!110672 true))

(declare-fun tp_is_empty!35237 () Bool)

(assert (=> start!110672 tp_is_empty!35237))

(declare-fun e!747166 () Bool)

(declare-fun array_inv!31900 (array!87466) Bool)

(assert (=> start!110672 (and (array_inv!31900 _values!1354) e!747166)))

(declare-fun b!1309548 () Bool)

(assert (=> b!1309548 (= e!747164 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585279 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun zeroValue!1296 () V!52085)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52085)

(declare-datatypes ((tuple2!22784 0))(
  ( (tuple2!22785 (_1!11403 (_ BitVec 64)) (_2!11403 V!52085)) )
))
(declare-datatypes ((List!29928 0))(
  ( (Nil!29925) (Cons!29924 (h!31133 tuple2!22784) (t!43534 List!29928)) )
))
(declare-datatypes ((ListLongMap!20441 0))(
  ( (ListLongMap!20442 (toList!10236 List!29928)) )
))
(declare-fun contains!8386 (ListLongMap!20441 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5249 (array!87464 array!87466 (_ BitVec 32) (_ BitVec 32) V!52085 V!52085 (_ BitVec 32) Int) ListLongMap!20441)

(assert (=> b!1309548 (= lt!585279 (contains!8386 (getCurrentListMap!5249 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapIsEmpty!54484 () Bool)

(declare-fun mapRes!54484 () Bool)

(assert (=> mapIsEmpty!54484 mapRes!54484))

(declare-fun b!1309549 () Bool)

(declare-fun e!747163 () Bool)

(assert (=> b!1309549 (= e!747163 tp_is_empty!35237)))

(declare-fun b!1309550 () Bool)

(declare-fun res!869311 () Bool)

(assert (=> b!1309550 (=> (not res!869311) (not e!747164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87464 (_ BitVec 32)) Bool)

(assert (=> b!1309550 (= res!869311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309551 () Bool)

(declare-fun e!747165 () Bool)

(assert (=> b!1309551 (= e!747166 (and e!747165 mapRes!54484))))

(declare-fun condMapEmpty!54484 () Bool)

(declare-fun mapDefault!54484 () ValueCell!16720)

