; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3988 () Bool)

(assert start!3988)

(declare-fun b_free!893 () Bool)

(declare-fun b_next!893 () Bool)

(assert (=> start!3988 (= b_free!893 (not b_next!893))))

(declare-fun tp!4098 () Bool)

(declare-fun b_and!1703 () Bool)

(assert (=> start!3988 (= tp!4098 b_and!1703)))

(declare-fun b!28820 () Bool)

(declare-fun e!18636 () Bool)

(declare-fun tp_is_empty!1247 () Bool)

(assert (=> b!28820 (= e!18636 tp_is_empty!1247)))

(declare-fun mapIsEmpty!1399 () Bool)

(declare-fun mapRes!1399 () Bool)

(assert (=> mapIsEmpty!1399 mapRes!1399))

(declare-fun b!28821 () Bool)

(declare-fun res!17223 () Bool)

(declare-fun e!18632 () Bool)

(assert (=> b!28821 (=> (not res!17223) (not e!18632))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28821 (= res!17223 (validKeyInArray!0 k!1304))))

(declare-fun b!28822 () Bool)

(declare-fun res!17225 () Bool)

(assert (=> b!28822 (=> (not res!17225) (not e!18632))))

(declare-datatypes ((array!1729 0))(
  ( (array!1730 (arr!818 (Array (_ BitVec 32) (_ BitVec 64))) (size!919 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1729)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1729 (_ BitVec 32)) Bool)

(assert (=> b!28822 (= res!17225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28823 () Bool)

(declare-fun res!17222 () Bool)

(declare-fun e!18638 () Bool)

(assert (=> b!28823 (=> (not res!17222) (not e!18638))))

(declare-fun arrayContainsKey!0 (array!1729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28823 (= res!17222 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun res!17226 () Bool)

(assert (=> start!3988 (=> (not res!17226) (not e!18632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3988 (= res!17226 (validMask!0 mask!2294))))

(assert (=> start!3988 e!18632))

(assert (=> start!3988 true))

(assert (=> start!3988 tp!4098))

(declare-datatypes ((V!1487 0))(
  ( (V!1488 (val!650 Int)) )
))
(declare-datatypes ((ValueCell!424 0))(
  ( (ValueCellFull!424 (v!1739 V!1487)) (EmptyCell!424) )
))
(declare-datatypes ((array!1731 0))(
  ( (array!1732 (arr!819 (Array (_ BitVec 32) ValueCell!424)) (size!920 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1731)

(declare-fun e!18635 () Bool)

(declare-fun array_inv!563 (array!1731) Bool)

(assert (=> start!3988 (and (array_inv!563 _values!1501) e!18635)))

(declare-fun array_inv!564 (array!1729) Bool)

(assert (=> start!3988 (array_inv!564 _keys!1833)))

(assert (=> start!3988 tp_is_empty!1247))

(declare-fun b!28824 () Bool)

(assert (=> b!28824 (= e!18635 (and e!18636 mapRes!1399))))

(declare-fun condMapEmpty!1399 () Bool)

(declare-fun mapDefault!1399 () ValueCell!424)

