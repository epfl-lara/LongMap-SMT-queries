; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33908 () Bool)

(assert start!33908)

(declare-fun b_free!7087 () Bool)

(declare-fun b_next!7087 () Bool)

(assert (=> start!33908 (= b_free!7087 (not b_next!7087))))

(declare-fun tp!24773 () Bool)

(declare-fun b_and!14273 () Bool)

(assert (=> start!33908 (= tp!24773 b_and!14273)))

(declare-fun b!337766 () Bool)

(declare-datatypes ((Unit!10474 0))(
  ( (Unit!10475) )
))
(declare-fun e!207247 () Unit!10474)

(declare-fun Unit!10476 () Unit!10474)

(assert (=> b!337766 (= e!207247 Unit!10476)))

(declare-fun lt!160502 () Unit!10474)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10363 0))(
  ( (V!10364 (val!3564 Int)) )
))
(declare-fun zeroValue!1467 () V!10363)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3176 0))(
  ( (ValueCellFull!3176 (v!5729 V!10363)) (EmptyCell!3176) )
))
(declare-datatypes ((array!17671 0))(
  ( (array!17672 (arr!8363 (Array (_ BitVec 32) ValueCell!3176)) (size!8715 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17671)

(declare-datatypes ((array!17673 0))(
  ( (array!17674 (arr!8364 (Array (_ BitVec 32) (_ BitVec 64))) (size!8716 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17673)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10363)

(declare-fun lemmaArrayContainsKeyThenInListMap!265 (array!17673 array!17671 (_ BitVec 32) (_ BitVec 32) V!10363 V!10363 (_ BitVec 64) (_ BitVec 32) Int) Unit!10474)

(declare-fun arrayScanForKey!0 (array!17673 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337766 (= lt!160502 (lemmaArrayContainsKeyThenInListMap!265 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337766 false))

(declare-fun mapIsEmpty!11964 () Bool)

(declare-fun mapRes!11964 () Bool)

(assert (=> mapIsEmpty!11964 mapRes!11964))

(declare-fun b!337767 () Bool)

(declare-fun res!186620 () Bool)

(declare-fun e!207252 () Bool)

(assert (=> b!337767 (=> (not res!186620) (not e!207252))))

(assert (=> b!337767 (= res!186620 (and (= (size!8715 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8716 _keys!1895) (size!8715 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337768 () Bool)

(declare-fun e!207250 () Bool)

(declare-fun tp_is_empty!7039 () Bool)

(assert (=> b!337768 (= e!207250 tp_is_empty!7039)))

(declare-fun b!337769 () Bool)

(declare-fun e!207251 () Bool)

(assert (=> b!337769 (= e!207251 tp_is_empty!7039)))

(declare-fun b!337770 () Bool)

(declare-fun e!207249 () Bool)

(assert (=> b!337770 (= e!207249 (and e!207250 mapRes!11964))))

(declare-fun condMapEmpty!11964 () Bool)

(declare-fun mapDefault!11964 () ValueCell!3176)

