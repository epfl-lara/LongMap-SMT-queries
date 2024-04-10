; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36770 () Bool)

(assert start!36770)

(declare-fun b!367074 () Bool)

(declare-fun res!205450 () Bool)

(declare-fun e!224687 () Bool)

(assert (=> b!367074 (=> (not res!205450) (not e!224687))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367074 (= res!205450 (validKeyInArray!0 k!778))))

(declare-fun b!367075 () Bool)

(declare-fun e!224686 () Bool)

(declare-fun tp_is_empty!8545 () Bool)

(assert (=> b!367075 (= e!224686 tp_is_empty!8545)))

(declare-fun b!367076 () Bool)

(declare-fun res!205451 () Bool)

(assert (=> b!367076 (=> (not res!205451) (not e!224687))))

(declare-datatypes ((array!21049 0))(
  ( (array!21050 (arr!9993 (Array (_ BitVec 32) (_ BitVec 64))) (size!10345 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21049)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21049 (_ BitVec 32)) Bool)

(assert (=> b!367076 (= res!205451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367077 () Bool)

(declare-fun e!224685 () Bool)

(assert (=> b!367077 (= e!224685 false)))

(declare-fun lt!169323 () Bool)

(declare-fun lt!169322 () array!21049)

(declare-datatypes ((List!5560 0))(
  ( (Nil!5557) (Cons!5556 (h!6412 (_ BitVec 64)) (t!10710 List!5560)) )
))
(declare-fun arrayNoDuplicates!0 (array!21049 (_ BitVec 32) List!5560) Bool)

(assert (=> b!367077 (= lt!169323 (arrayNoDuplicates!0 lt!169322 #b00000000000000000000000000000000 Nil!5557))))

(declare-fun b!367078 () Bool)

(declare-fun e!224684 () Bool)

(assert (=> b!367078 (= e!224684 tp_is_empty!8545)))

(declare-fun b!367079 () Bool)

(assert (=> b!367079 (= e!224687 e!224685)))

(declare-fun res!205447 () Bool)

(assert (=> b!367079 (=> (not res!205447) (not e!224685))))

(assert (=> b!367079 (= res!205447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169322 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367079 (= lt!169322 (array!21050 (store (arr!9993 _keys!658) i!548 k!778) (size!10345 _keys!658)))))

(declare-fun b!367080 () Bool)

(declare-fun res!205444 () Bool)

(assert (=> b!367080 (=> (not res!205444) (not e!224687))))

(declare-fun arrayContainsKey!0 (array!21049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367080 (= res!205444 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!367081 () Bool)

(declare-fun res!205449 () Bool)

(assert (=> b!367081 (=> (not res!205449) (not e!224687))))

(assert (=> b!367081 (= res!205449 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10345 _keys!658))))))

(declare-fun b!367082 () Bool)

(declare-fun e!224682 () Bool)

(declare-fun mapRes!14382 () Bool)

(assert (=> b!367082 (= e!224682 (and e!224686 mapRes!14382))))

(declare-fun condMapEmpty!14382 () Bool)

(declare-datatypes ((V!12499 0))(
  ( (V!12500 (val!4317 Int)) )
))
(declare-datatypes ((ValueCell!3929 0))(
  ( (ValueCellFull!3929 (v!6514 V!12499)) (EmptyCell!3929) )
))
(declare-datatypes ((array!21051 0))(
  ( (array!21052 (arr!9994 (Array (_ BitVec 32) ValueCell!3929)) (size!10346 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21051)

(declare-fun mapDefault!14382 () ValueCell!3929)

