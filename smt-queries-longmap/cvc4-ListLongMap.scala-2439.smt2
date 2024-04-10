; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38456 () Bool)

(assert start!38456)

(declare-fun mapIsEmpty!16434 () Bool)

(declare-fun mapRes!16434 () Bool)

(assert (=> mapIsEmpty!16434 mapRes!16434))

(declare-fun b!396788 () Bool)

(declare-fun res!227705 () Bool)

(declare-fun e!240057 () Bool)

(assert (=> b!396788 (=> (not res!227705) (not e!240057))))

(declare-datatypes ((array!23663 0))(
  ( (array!23664 (arr!11281 (Array (_ BitVec 32) (_ BitVec 64))) (size!11633 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23663)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396788 (= res!227705 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!396789 () Bool)

(declare-fun res!227703 () Bool)

(assert (=> b!396789 (=> (not res!227703) (not e!240057))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396789 (= res!227703 (or (= (select (arr!11281 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11281 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396790 () Bool)

(declare-fun res!227707 () Bool)

(assert (=> b!396790 (=> (not res!227707) (not e!240057))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14271 0))(
  ( (V!14272 (val!4982 Int)) )
))
(declare-datatypes ((ValueCell!4594 0))(
  ( (ValueCellFull!4594 (v!7229 V!14271)) (EmptyCell!4594) )
))
(declare-datatypes ((array!23665 0))(
  ( (array!23666 (arr!11282 (Array (_ BitVec 32) ValueCell!4594)) (size!11634 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23665)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!396790 (= res!227707 (and (= (size!11634 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11633 _keys!709) (size!11634 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396791 () Bool)

(declare-fun res!227704 () Bool)

(assert (=> b!396791 (=> (not res!227704) (not e!240057))))

(declare-datatypes ((List!6534 0))(
  ( (Nil!6531) (Cons!6530 (h!7386 (_ BitVec 64)) (t!11708 List!6534)) )
))
(declare-fun arrayNoDuplicates!0 (array!23663 (_ BitVec 32) List!6534) Bool)

(assert (=> b!396791 (= res!227704 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6531))))

(declare-fun b!396792 () Bool)

(declare-fun e!240060 () Bool)

(assert (=> b!396792 (= e!240060 false)))

(declare-fun lt!187204 () Bool)

(declare-fun lt!187205 () array!23663)

(assert (=> b!396792 (= lt!187204 (arrayNoDuplicates!0 lt!187205 #b00000000000000000000000000000000 Nil!6531))))

(declare-fun b!396793 () Bool)

(declare-fun res!227702 () Bool)

(assert (=> b!396793 (=> (not res!227702) (not e!240057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396793 (= res!227702 (validKeyInArray!0 k!794))))

(declare-fun b!396794 () Bool)

(declare-fun e!240059 () Bool)

(declare-fun e!240056 () Bool)

(assert (=> b!396794 (= e!240059 (and e!240056 mapRes!16434))))

(declare-fun condMapEmpty!16434 () Bool)

(declare-fun mapDefault!16434 () ValueCell!4594)

