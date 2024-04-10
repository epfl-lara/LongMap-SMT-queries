; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38438 () Bool)

(assert start!38438)

(declare-fun b!396437 () Bool)

(declare-fun res!227439 () Bool)

(declare-fun e!239896 () Bool)

(assert (=> b!396437 (=> (not res!227439) (not e!239896))))

(declare-datatypes ((array!23627 0))(
  ( (array!23628 (arr!11263 (Array (_ BitVec 32) (_ BitVec 64))) (size!11615 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23627)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23627 (_ BitVec 32)) Bool)

(assert (=> b!396437 (= res!227439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396438 () Bool)

(declare-fun res!227436 () Bool)

(assert (=> b!396438 (=> (not res!227436) (not e!239896))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396438 (= res!227436 (validKeyInArray!0 k!794))))

(declare-fun b!396439 () Bool)

(declare-fun res!227433 () Bool)

(assert (=> b!396439 (=> (not res!227433) (not e!239896))))

(declare-datatypes ((List!6526 0))(
  ( (Nil!6523) (Cons!6522 (h!7378 (_ BitVec 64)) (t!11700 List!6526)) )
))
(declare-fun arrayNoDuplicates!0 (array!23627 (_ BitVec 32) List!6526) Bool)

(assert (=> b!396439 (= res!227433 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6523))))

(declare-fun b!396441 () Bool)

(declare-fun e!239893 () Bool)

(assert (=> b!396441 (= e!239896 e!239893)))

(declare-fun res!227431 () Bool)

(assert (=> b!396441 (=> (not res!227431) (not e!239893))))

(declare-fun lt!187150 () array!23627)

(assert (=> b!396441 (= res!227431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187150 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396441 (= lt!187150 (array!23628 (store (arr!11263 _keys!709) i!563 k!794) (size!11615 _keys!709)))))

(declare-fun mapIsEmpty!16407 () Bool)

(declare-fun mapRes!16407 () Bool)

(assert (=> mapIsEmpty!16407 mapRes!16407))

(declare-fun b!396442 () Bool)

(declare-fun res!227435 () Bool)

(assert (=> b!396442 (=> (not res!227435) (not e!239896))))

(declare-fun arrayContainsKey!0 (array!23627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396442 (= res!227435 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!396443 () Bool)

(declare-fun e!239897 () Bool)

(declare-fun e!239894 () Bool)

(assert (=> b!396443 (= e!239897 (and e!239894 mapRes!16407))))

(declare-fun condMapEmpty!16407 () Bool)

(declare-datatypes ((V!14247 0))(
  ( (V!14248 (val!4973 Int)) )
))
(declare-datatypes ((ValueCell!4585 0))(
  ( (ValueCellFull!4585 (v!7220 V!14247)) (EmptyCell!4585) )
))
(declare-datatypes ((array!23629 0))(
  ( (array!23630 (arr!11264 (Array (_ BitVec 32) ValueCell!4585)) (size!11616 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23629)

(declare-fun mapDefault!16407 () ValueCell!4585)

