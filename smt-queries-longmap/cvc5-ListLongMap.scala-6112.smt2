; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78780 () Bool)

(assert start!78780)

(declare-fun b_free!16993 () Bool)

(declare-fun b_next!16993 () Bool)

(assert (=> start!78780 (= b_free!16993 (not b_next!16993))))

(declare-fun tp!59419 () Bool)

(declare-fun b_and!27723 () Bool)

(assert (=> start!78780 (= tp!59419 b_and!27723)))

(declare-fun b!919436 () Bool)

(declare-fun e!516089 () Bool)

(declare-fun e!516085 () Bool)

(assert (=> b!919436 (= e!516089 e!516085)))

(declare-fun res!619960 () Bool)

(assert (=> b!919436 (=> (not res!619960) (not e!516085))))

(declare-fun lt!412703 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919436 (= res!619960 (validKeyInArray!0 lt!412703))))

(declare-datatypes ((array!54986 0))(
  ( (array!54987 (arr!26438 (Array (_ BitVec 32) (_ BitVec 64))) (size!26897 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54986)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919436 (= lt!412703 (select (arr!26438 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31008 () Bool)

(declare-fun mapRes!31008 () Bool)

(assert (=> mapIsEmpty!31008 mapRes!31008))

(declare-fun b!919437 () Bool)

(declare-fun res!619964 () Bool)

(assert (=> b!919437 (=> (not res!619964) (not e!516089))))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!919437 (= res!619964 (validKeyInArray!0 k!1099))))

(declare-fun b!919438 () Bool)

(declare-fun res!619962 () Bool)

(assert (=> b!919438 (=> (not res!619962) (not e!516089))))

(assert (=> b!919438 (= res!619962 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919439 () Bool)

(declare-fun e!516086 () Bool)

(declare-fun tp_is_empty!19501 () Bool)

(assert (=> b!919439 (= e!516086 tp_is_empty!19501)))

(declare-fun res!619969 () Bool)

(declare-fun e!516088 () Bool)

(assert (=> start!78780 (=> (not res!619969) (not e!516088))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78780 (= res!619969 (validMask!0 mask!1881))))

(assert (=> start!78780 e!516088))

(assert (=> start!78780 true))

(assert (=> start!78780 tp_is_empty!19501))

(declare-datatypes ((V!30967 0))(
  ( (V!30968 (val!9801 Int)) )
))
(declare-datatypes ((ValueCell!9269 0))(
  ( (ValueCellFull!9269 (v!12319 V!30967)) (EmptyCell!9269) )
))
(declare-datatypes ((array!54988 0))(
  ( (array!54989 (arr!26439 (Array (_ BitVec 32) ValueCell!9269)) (size!26898 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54988)

(declare-fun e!516090 () Bool)

(declare-fun array_inv!20606 (array!54988) Bool)

(assert (=> start!78780 (and (array_inv!20606 _values!1231) e!516090)))

(assert (=> start!78780 tp!59419))

(declare-fun array_inv!20607 (array!54986) Bool)

(assert (=> start!78780 (array_inv!20607 _keys!1487)))

(declare-fun b!919440 () Bool)

(declare-fun res!619965 () Bool)

(assert (=> b!919440 (=> (not res!619965) (not e!516088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54986 (_ BitVec 32)) Bool)

(assert (=> b!919440 (= res!619965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31008 () Bool)

(declare-fun tp!59420 () Bool)

(declare-fun e!516091 () Bool)

(assert (=> mapNonEmpty!31008 (= mapRes!31008 (and tp!59420 e!516091))))

(declare-fun mapValue!31008 () ValueCell!9269)

(declare-fun mapRest!31008 () (Array (_ BitVec 32) ValueCell!9269))

(declare-fun mapKey!31008 () (_ BitVec 32))

(assert (=> mapNonEmpty!31008 (= (arr!26439 _values!1231) (store mapRest!31008 mapKey!31008 mapValue!31008))))

(declare-fun b!919441 () Bool)

(declare-fun res!619963 () Bool)

(assert (=> b!919441 (=> (not res!619963) (not e!516088))))

(assert (=> b!919441 (= res!619963 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26897 _keys!1487))))))

(declare-fun b!919442 () Bool)

(assert (=> b!919442 (= e!516090 (and e!516086 mapRes!31008))))

(declare-fun condMapEmpty!31008 () Bool)

(declare-fun mapDefault!31008 () ValueCell!9269)

