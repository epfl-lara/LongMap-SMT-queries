; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82564 () Bool)

(assert start!82564)

(declare-fun b_free!18697 () Bool)

(declare-fun b_next!18697 () Bool)

(assert (=> start!82564 (= b_free!18697 (not b_next!18697))))

(declare-fun tp!65210 () Bool)

(declare-fun b_and!30185 () Bool)

(assert (=> start!82564 (= tp!65210 b_and!30185)))

(declare-fun b!962195 () Bool)

(declare-fun res!643922 () Bool)

(declare-fun e!542611 () Bool)

(assert (=> b!962195 (=> (not res!643922) (not e!542611))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33649 0))(
  ( (V!33650 (val!10800 Int)) )
))
(declare-datatypes ((ValueCell!10268 0))(
  ( (ValueCellFull!10268 (v!13358 V!33649)) (EmptyCell!10268) )
))
(declare-datatypes ((array!59095 0))(
  ( (array!59096 (arr!28416 (Array (_ BitVec 32) ValueCell!10268)) (size!28895 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59095)

(declare-datatypes ((array!59097 0))(
  ( (array!59098 (arr!28417 (Array (_ BitVec 32) (_ BitVec 64))) (size!28896 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59097)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962195 (= res!643922 (and (= (size!28895 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28896 _keys!1686) (size!28895 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962196 () Bool)

(declare-fun res!643927 () Bool)

(assert (=> b!962196 (=> (not res!643927) (not e!542611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59097 (_ BitVec 32)) Bool)

(assert (=> b!962196 (= res!643927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34243 () Bool)

(declare-fun mapRes!34243 () Bool)

(assert (=> mapIsEmpty!34243 mapRes!34243))

(declare-fun b!962197 () Bool)

(declare-fun res!643926 () Bool)

(assert (=> b!962197 (=> (not res!643926) (not e!542611))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962197 (= res!643926 (validKeyInArray!0 (select (arr!28417 _keys!1686) i!803)))))

(declare-fun b!962198 () Bool)

(declare-fun e!542612 () Bool)

(declare-fun tp_is_empty!21499 () Bool)

(assert (=> b!962198 (= e!542612 tp_is_empty!21499)))

(declare-fun b!962199 () Bool)

(declare-fun e!542615 () Bool)

(assert (=> b!962199 (= e!542615 tp_is_empty!21499)))

(declare-fun b!962200 () Bool)

(declare-fun res!643924 () Bool)

(assert (=> b!962200 (=> (not res!643924) (not e!542611))))

(declare-datatypes ((List!19721 0))(
  ( (Nil!19718) (Cons!19717 (h!20879 (_ BitVec 64)) (t!28084 List!19721)) )
))
(declare-fun arrayNoDuplicates!0 (array!59097 (_ BitVec 32) List!19721) Bool)

(assert (=> b!962200 (= res!643924 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19718))))

(declare-fun b!962201 () Bool)

(declare-fun e!542614 () Bool)

(assert (=> b!962201 (= e!542614 (and e!542615 mapRes!34243))))

(declare-fun condMapEmpty!34243 () Bool)

(declare-fun mapDefault!34243 () ValueCell!10268)

