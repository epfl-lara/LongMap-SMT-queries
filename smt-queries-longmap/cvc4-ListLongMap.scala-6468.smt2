; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82652 () Bool)

(assert start!82652)

(declare-fun b_free!18785 () Bool)

(declare-fun b_next!18785 () Bool)

(assert (=> start!82652 (= b_free!18785 (not b_next!18785))))

(declare-fun tp!65475 () Bool)

(declare-fun b_and!30273 () Bool)

(assert (=> start!82652 (= tp!65475 b_and!30273)))

(declare-fun b!963525 () Bool)

(declare-fun res!644859 () Bool)

(declare-fun e!543273 () Bool)

(assert (=> b!963525 (=> (not res!644859) (not e!543273))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33765 0))(
  ( (V!33766 (val!10844 Int)) )
))
(declare-datatypes ((ValueCell!10312 0))(
  ( (ValueCellFull!10312 (v!13402 V!33765)) (EmptyCell!10312) )
))
(declare-datatypes ((array!59267 0))(
  ( (array!59268 (arr!28502 (Array (_ BitVec 32) ValueCell!10312)) (size!28981 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59267)

(declare-datatypes ((array!59269 0))(
  ( (array!59270 (arr!28503 (Array (_ BitVec 32) (_ BitVec 64))) (size!28982 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59269)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963525 (= res!644859 (and (= (size!28981 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28982 _keys!1686) (size!28981 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963526 () Bool)

(declare-fun e!543271 () Bool)

(declare-fun tp_is_empty!21587 () Bool)

(assert (=> b!963526 (= e!543271 tp_is_empty!21587)))

(declare-fun b!963527 () Bool)

(declare-fun e!543275 () Bool)

(assert (=> b!963527 (= e!543275 tp_is_empty!21587)))

(declare-fun b!963528 () Bool)

(declare-fun res!644856 () Bool)

(assert (=> b!963528 (=> (not res!644856) (not e!543273))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963528 (= res!644856 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963529 () Bool)

(declare-fun res!644860 () Bool)

(assert (=> b!963529 (=> (not res!644860) (not e!543273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59269 (_ BitVec 32)) Bool)

(assert (=> b!963529 (= res!644860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34375 () Bool)

(declare-fun mapRes!34375 () Bool)

(declare-fun tp!65474 () Bool)

(assert (=> mapNonEmpty!34375 (= mapRes!34375 (and tp!65474 e!543275))))

(declare-fun mapKey!34375 () (_ BitVec 32))

(declare-fun mapValue!34375 () ValueCell!10312)

(declare-fun mapRest!34375 () (Array (_ BitVec 32) ValueCell!10312))

(assert (=> mapNonEmpty!34375 (= (arr!28502 _values!1400) (store mapRest!34375 mapKey!34375 mapValue!34375))))

(declare-fun mapIsEmpty!34375 () Bool)

(assert (=> mapIsEmpty!34375 mapRes!34375))

(declare-fun b!963530 () Bool)

(declare-fun e!543272 () Bool)

(assert (=> b!963530 (= e!543272 (and e!543271 mapRes!34375))))

(declare-fun condMapEmpty!34375 () Bool)

(declare-fun mapDefault!34375 () ValueCell!10312)

