; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6128 () Bool)

(assert start!6128)

(declare-fun res!25116 () Bool)

(declare-fun e!26689 () Bool)

(assert (=> start!6128 (=> (not res!25116) (not e!26689))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6128 (= res!25116 (validMask!0 mask!853))))

(assert (=> start!6128 e!26689))

(assert (=> start!6128 true))

(declare-fun b!42190 () Bool)

(assert (=> b!42190 (= e!26689 (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111))))

(assert (= (and start!6128 res!25116) b!42190))

(declare-fun m!35771 () Bool)

(assert (=> start!6128 m!35771))

(push 1)

(assert (not start!6128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

