; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35100 () Bool)

(assert start!35100)

(declare-fun b_free!7745 () Bool)

(declare-fun b_next!7745 () Bool)

(assert (=> start!35100 (= b_free!7745 (not b_next!7745))))

(declare-fun tp!26819 () Bool)

(declare-fun b_and!14979 () Bool)

(assert (=> start!35100 (= tp!26819 b_and!14979)))

(declare-fun b!351825 () Bool)

(declare-fun res!195110 () Bool)

(declare-fun e!215449 () Bool)

(assert (=> b!351825 (=> (not res!195110) (not e!215449))))

(declare-datatypes ((array!18983 0))(
  ( (array!18984 (arr!8995 (Array (_ BitVec 32) (_ BitVec 64))) (size!9347 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18983)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18983 (_ BitVec 32)) Bool)

(assert (=> b!351825 (= res!195110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351826 () Bool)

(declare-fun res!195108 () Bool)

(assert (=> b!351826 (=> (not res!195108) (not e!215449))))

(declare-datatypes ((List!5234 0))(
  ( (Nil!5231) (Cons!5230 (h!6086 (_ BitVec 64)) (t!10376 List!5234)) )
))
(declare-fun arrayNoDuplicates!0 (array!18983 (_ BitVec 32) List!5234) Bool)

(assert (=> b!351826 (= res!195108 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5231))))

(declare-fun b!351827 () Bool)

(declare-fun res!195106 () Bool)

(declare-fun e!215453 () Bool)

(assert (=> b!351827 (=> (not res!195106) (not e!215453))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351827 (= res!195106 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!351828 () Bool)

(declare-fun e!215450 () Bool)

(declare-fun tp_is_empty!7697 () Bool)

(assert (=> b!351828 (= e!215450 tp_is_empty!7697)))

(declare-fun b!351829 () Bool)

(assert (=> b!351829 (= e!215449 e!215453)))

(declare-fun res!195113 () Bool)

(assert (=> b!351829 (=> (not res!195113) (not e!215453))))

(declare-datatypes ((SeekEntryResult!3461 0))(
  ( (MissingZero!3461 (index!16023 (_ BitVec 32))) (Found!3461 (index!16024 (_ BitVec 32))) (Intermediate!3461 (undefined!4273 Bool) (index!16025 (_ BitVec 32)) (x!35009 (_ BitVec 32))) (Undefined!3461) (MissingVacant!3461 (index!16026 (_ BitVec 32))) )
))
(declare-fun lt!164979 () SeekEntryResult!3461)

(assert (=> b!351829 (= res!195113 (and (not (is-Found!3461 lt!164979)) (not (is-MissingZero!3461 lt!164979)) (is-MissingVacant!3461 lt!164979)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18983 (_ BitVec 32)) SeekEntryResult!3461)

(assert (=> b!351829 (= lt!164979 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!351830 () Bool)

(declare-fun e!215451 () Bool)

(declare-fun e!215454 () Bool)

(declare-fun mapRes!13023 () Bool)

(assert (=> b!351830 (= e!215451 (and e!215454 mapRes!13023))))

(declare-fun condMapEmpty!13023 () Bool)

(declare-datatypes ((V!11239 0))(
  ( (V!11240 (val!3893 Int)) )
))
(declare-datatypes ((ValueCell!3505 0))(
  ( (ValueCellFull!3505 (v!6082 V!11239)) (EmptyCell!3505) )
))
(declare-datatypes ((array!18985 0))(
  ( (array!18986 (arr!8996 (Array (_ BitVec 32) ValueCell!3505)) (size!9348 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18985)

(declare-fun mapDefault!13023 () ValueCell!3505)

