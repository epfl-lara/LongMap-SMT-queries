; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35994 () Bool)

(assert start!35994)

(declare-fun b!361539 () Bool)

(declare-fun res!201119 () Bool)

(declare-fun e!221421 () Bool)

(assert (=> b!361539 (=> (not res!201119) (not e!221421))))

(declare-datatypes ((array!20325 0))(
  ( (array!20326 (arr!9650 (Array (_ BitVec 32) (_ BitVec 64))) (size!10002 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20325)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12159 0))(
  ( (V!12160 (val!4238 Int)) )
))
(declare-datatypes ((ValueCell!3850 0))(
  ( (ValueCellFull!3850 (v!6433 V!12159)) (EmptyCell!3850) )
))
(declare-datatypes ((array!20327 0))(
  ( (array!20328 (arr!9651 (Array (_ BitVec 32) ValueCell!3850)) (size!10003 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20327)

(assert (=> b!361539 (= res!201119 (and (= (size!10003 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10002 _keys!1541) (size!10003 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361540 () Bool)

(declare-fun e!221417 () Bool)

(declare-fun tp_is_empty!8387 () Bool)

(assert (=> b!361540 (= e!221417 tp_is_empty!8387)))

(declare-fun b!361541 () Bool)

(assert (=> b!361541 (= e!221421 false)))

(declare-fun lt!166575 () Bool)

(declare-datatypes ((List!5509 0))(
  ( (Nil!5506) (Cons!5505 (h!6361 (_ BitVec 64)) (t!10659 List!5509)) )
))
(declare-fun arrayNoDuplicates!0 (array!20325 (_ BitVec 32) List!5509) Bool)

(assert (=> b!361541 (= lt!166575 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5506))))

(declare-fun b!361542 () Bool)

(declare-fun res!201118 () Bool)

(assert (=> b!361542 (=> (not res!201118) (not e!221421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20325 (_ BitVec 32)) Bool)

(assert (=> b!361542 (= res!201118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun res!201117 () Bool)

(assert (=> start!35994 (=> (not res!201117) (not e!221421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35994 (= res!201117 (validMask!0 mask!1943))))

(assert (=> start!35994 e!221421))

(assert (=> start!35994 true))

(declare-fun e!221419 () Bool)

(declare-fun array_inv!7096 (array!20327) Bool)

(assert (=> start!35994 (and (array_inv!7096 _values!1277) e!221419)))

(declare-fun array_inv!7097 (array!20325) Bool)

(assert (=> start!35994 (array_inv!7097 _keys!1541)))

(declare-fun mapNonEmpty!14106 () Bool)

(declare-fun mapRes!14106 () Bool)

(declare-fun tp!28182 () Bool)

(declare-fun e!221420 () Bool)

(assert (=> mapNonEmpty!14106 (= mapRes!14106 (and tp!28182 e!221420))))

(declare-fun mapKey!14106 () (_ BitVec 32))

(declare-fun mapRest!14106 () (Array (_ BitVec 32) ValueCell!3850))

(declare-fun mapValue!14106 () ValueCell!3850)

(assert (=> mapNonEmpty!14106 (= (arr!9651 _values!1277) (store mapRest!14106 mapKey!14106 mapValue!14106))))

(declare-fun b!361543 () Bool)

(assert (=> b!361543 (= e!221419 (and e!221417 mapRes!14106))))

(declare-fun condMapEmpty!14106 () Bool)

(declare-fun mapDefault!14106 () ValueCell!3850)

