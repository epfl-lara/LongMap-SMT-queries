; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39656 () Bool)

(assert start!39656)

(declare-fun b_free!9923 () Bool)

(declare-fun b_next!9923 () Bool)

(assert (=> start!39656 (= b_free!9923 (not b_next!9923))))

(declare-fun tp!35297 () Bool)

(declare-fun b_and!17579 () Bool)

(assert (=> start!39656 (= tp!35297 b_and!17579)))

(declare-fun b!425567 () Bool)

(declare-fun res!249191 () Bool)

(declare-fun e!252622 () Bool)

(assert (=> b!425567 (=> (not res!249191) (not e!252622))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425567 (= res!249191 (validMask!0 mask!1025))))

(declare-fun b!425568 () Bool)

(declare-fun e!252619 () Bool)

(assert (=> b!425568 (= e!252622 e!252619)))

(declare-fun res!249193 () Bool)

(assert (=> b!425568 (=> (not res!249193) (not e!252619))))

(declare-datatypes ((array!25989 0))(
  ( (array!25990 (arr!12444 (Array (_ BitVec 32) (_ BitVec 64))) (size!12796 (_ BitVec 32))) )
))
(declare-fun lt!194691 () array!25989)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25989 (_ BitVec 32)) Bool)

(assert (=> b!425568 (= res!249193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194691 mask!1025))))

(declare-fun _keys!709 () array!25989)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425568 (= lt!194691 (array!25990 (store (arr!12444 _keys!709) i!563 k!794) (size!12796 _keys!709)))))

(declare-fun b!425569 () Bool)

(declare-fun e!252624 () Bool)

(declare-fun tp_is_empty!11075 () Bool)

(assert (=> b!425569 (= e!252624 tp_is_empty!11075)))

(declare-fun res!249197 () Bool)

(assert (=> start!39656 (=> (not res!249197) (not e!252622))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39656 (= res!249197 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12796 _keys!709))))))

(assert (=> start!39656 e!252622))

(assert (=> start!39656 tp_is_empty!11075))

(assert (=> start!39656 tp!35297))

(assert (=> start!39656 true))

(declare-datatypes ((V!15871 0))(
  ( (V!15872 (val!5582 Int)) )
))
(declare-datatypes ((ValueCell!5194 0))(
  ( (ValueCellFull!5194 (v!7829 V!15871)) (EmptyCell!5194) )
))
(declare-datatypes ((array!25991 0))(
  ( (array!25992 (arr!12445 (Array (_ BitVec 32) ValueCell!5194)) (size!12797 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25991)

(declare-fun e!252620 () Bool)

(declare-fun array_inv!9068 (array!25991) Bool)

(assert (=> start!39656 (and (array_inv!9068 _values!549) e!252620)))

(declare-fun array_inv!9069 (array!25989) Bool)

(assert (=> start!39656 (array_inv!9069 _keys!709)))

(declare-fun b!425570 () Bool)

(declare-fun res!249196 () Bool)

(assert (=> b!425570 (=> (not res!249196) (not e!252622))))

(declare-datatypes ((List!7342 0))(
  ( (Nil!7339) (Cons!7338 (h!8194 (_ BitVec 64)) (t!12786 List!7342)) )
))
(declare-fun arrayNoDuplicates!0 (array!25989 (_ BitVec 32) List!7342) Bool)

(assert (=> b!425570 (= res!249196 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7339))))

(declare-fun b!425571 () Bool)

(declare-fun res!249200 () Bool)

(assert (=> b!425571 (=> (not res!249200) (not e!252622))))

(declare-fun arrayContainsKey!0 (array!25989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425571 (= res!249200 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!425572 () Bool)

(declare-fun mapRes!18234 () Bool)

(assert (=> b!425572 (= e!252620 (and e!252624 mapRes!18234))))

(declare-fun condMapEmpty!18234 () Bool)

(declare-fun mapDefault!18234 () ValueCell!5194)

