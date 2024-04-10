; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109360 () Bool)

(assert start!109360)

(declare-fun b_free!28849 () Bool)

(declare-fun b_next!28849 () Bool)

(assert (=> start!109360 (= b_free!28849 (not b_next!28849))))

(declare-fun tp!101666 () Bool)

(declare-fun b_and!46939 () Bool)

(assert (=> start!109360 (= tp!101666 b_and!46939)))

(declare-fun b!1294437 () Bool)

(declare-fun res!860240 () Bool)

(declare-fun e!738650 () Bool)

(assert (=> b!1294437 (=> (not res!860240) (not e!738650))))

(declare-datatypes ((array!86000 0))(
  ( (array!86001 (arr!41501 (Array (_ BitVec 32) (_ BitVec 64))) (size!42051 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86000)

(declare-datatypes ((List!29438 0))(
  ( (Nil!29435) (Cons!29434 (h!30643 (_ BitVec 64)) (t!43002 List!29438)) )
))
(declare-fun arrayNoDuplicates!0 (array!86000 (_ BitVec 32) List!29438) Bool)

(assert (=> b!1294437 (= res!860240 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29435))))

(declare-fun b!1294438 () Bool)

(declare-fun res!860234 () Bool)

(assert (=> b!1294438 (=> (not res!860234) (not e!738650))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294438 (= res!860234 (not (validKeyInArray!0 (select (arr!41501 _keys!1741) from!2144))))))

(declare-fun res!860239 () Bool)

(assert (=> start!109360 (=> (not res!860239) (not e!738650))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109360 (= res!860239 (validMask!0 mask!2175))))

(assert (=> start!109360 e!738650))

(declare-fun tp_is_empty!34489 () Bool)

(assert (=> start!109360 tp_is_empty!34489))

(assert (=> start!109360 true))

(declare-datatypes ((V!51089 0))(
  ( (V!51090 (val!17319 Int)) )
))
(declare-datatypes ((ValueCell!16346 0))(
  ( (ValueCellFull!16346 (v!19922 V!51089)) (EmptyCell!16346) )
))
(declare-datatypes ((array!86002 0))(
  ( (array!86003 (arr!41502 (Array (_ BitVec 32) ValueCell!16346)) (size!42052 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86002)

(declare-fun e!738652 () Bool)

(declare-fun array_inv!31431 (array!86002) Bool)

(assert (=> start!109360 (and (array_inv!31431 _values!1445) e!738652)))

(declare-fun array_inv!31432 (array!86000) Bool)

(assert (=> start!109360 (array_inv!31432 _keys!1741)))

(assert (=> start!109360 tp!101666))

(declare-fun b!1294439 () Bool)

(declare-fun e!738651 () Bool)

(assert (=> b!1294439 (= e!738651 tp_is_empty!34489)))

(declare-fun b!1294440 () Bool)

(declare-fun e!738649 () Bool)

(assert (=> b!1294440 (= e!738649 tp_is_empty!34489)))

(declare-fun b!1294441 () Bool)

(declare-fun res!860238 () Bool)

(assert (=> b!1294441 (=> (not res!860238) (not e!738650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86000 (_ BitVec 32)) Bool)

(assert (=> b!1294441 (= res!860238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53294 () Bool)

(declare-fun mapRes!53294 () Bool)

(declare-fun tp!101665 () Bool)

(assert (=> mapNonEmpty!53294 (= mapRes!53294 (and tp!101665 e!738651))))

(declare-fun mapValue!53294 () ValueCell!16346)

(declare-fun mapRest!53294 () (Array (_ BitVec 32) ValueCell!16346))

(declare-fun mapKey!53294 () (_ BitVec 32))

(assert (=> mapNonEmpty!53294 (= (arr!41502 _values!1445) (store mapRest!53294 mapKey!53294 mapValue!53294))))

(declare-fun b!1294442 () Bool)

(assert (=> b!1294442 (= e!738652 (and e!738649 mapRes!53294))))

(declare-fun condMapEmpty!53294 () Bool)

(declare-fun mapDefault!53294 () ValueCell!16346)

