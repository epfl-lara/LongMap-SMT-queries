; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40532 () Bool)

(assert start!40532)

(declare-fun b!446658 () Bool)

(declare-fun res!265150 () Bool)

(declare-fun e!262384 () Bool)

(assert (=> b!446658 (=> (not res!265150) (not e!262384))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446658 (= res!265150 (validKeyInArray!0 k!794))))

(declare-fun b!446659 () Bool)

(declare-fun res!265155 () Bool)

(assert (=> b!446659 (=> (not res!265155) (not e!262384))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446659 (= res!265155 (validMask!0 mask!1025))))

(declare-fun b!446660 () Bool)

(declare-fun e!262386 () Bool)

(assert (=> b!446660 (= e!262386 false)))

(declare-fun lt!203843 () Bool)

(declare-datatypes ((array!27601 0))(
  ( (array!27602 (arr!13247 (Array (_ BitVec 32) (_ BitVec 64))) (size!13599 (_ BitVec 32))) )
))
(declare-fun lt!203842 () array!27601)

(declare-datatypes ((List!7924 0))(
  ( (Nil!7921) (Cons!7920 (h!8776 (_ BitVec 64)) (t!13684 List!7924)) )
))
(declare-fun arrayNoDuplicates!0 (array!27601 (_ BitVec 32) List!7924) Bool)

(assert (=> b!446660 (= lt!203843 (arrayNoDuplicates!0 lt!203842 #b00000000000000000000000000000000 Nil!7921))))

(declare-fun mapIsEmpty!19476 () Bool)

(declare-fun mapRes!19476 () Bool)

(assert (=> mapIsEmpty!19476 mapRes!19476))

(declare-fun b!446661 () Bool)

(declare-fun e!262381 () Bool)

(declare-fun tp_is_empty!11897 () Bool)

(assert (=> b!446661 (= e!262381 tp_is_empty!11897)))

(declare-fun b!446662 () Bool)

(declare-fun res!265151 () Bool)

(assert (=> b!446662 (=> (not res!265151) (not e!262384))))

(declare-fun _keys!709 () array!27601)

(declare-fun arrayContainsKey!0 (array!27601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446662 (= res!265151 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!265156 () Bool)

(assert (=> start!40532 (=> (not res!265156) (not e!262384))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40532 (= res!265156 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13599 _keys!709))))))

(assert (=> start!40532 e!262384))

(assert (=> start!40532 true))

(declare-datatypes ((V!16967 0))(
  ( (V!16968 (val!5993 Int)) )
))
(declare-datatypes ((ValueCell!5605 0))(
  ( (ValueCellFull!5605 (v!8248 V!16967)) (EmptyCell!5605) )
))
(declare-datatypes ((array!27603 0))(
  ( (array!27604 (arr!13248 (Array (_ BitVec 32) ValueCell!5605)) (size!13600 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27603)

(declare-fun e!262385 () Bool)

(declare-fun array_inv!9606 (array!27603) Bool)

(assert (=> start!40532 (and (array_inv!9606 _values!549) e!262385)))

(declare-fun array_inv!9607 (array!27601) Bool)

(assert (=> start!40532 (array_inv!9607 _keys!709)))

(declare-fun b!446663 () Bool)

(declare-fun res!265152 () Bool)

(assert (=> b!446663 (=> (not res!265152) (not e!262384))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446663 (= res!265152 (and (= (size!13600 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13599 _keys!709) (size!13600 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446664 () Bool)

(declare-fun e!262382 () Bool)

(assert (=> b!446664 (= e!262382 tp_is_empty!11897)))

(declare-fun b!446665 () Bool)

(declare-fun res!265154 () Bool)

(assert (=> b!446665 (=> (not res!265154) (not e!262384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27601 (_ BitVec 32)) Bool)

(assert (=> b!446665 (= res!265154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446666 () Bool)

(declare-fun res!265149 () Bool)

(assert (=> b!446666 (=> (not res!265149) (not e!262384))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446666 (= res!265149 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13599 _keys!709))))))

(declare-fun b!446667 () Bool)

(assert (=> b!446667 (= e!262385 (and e!262381 mapRes!19476))))

(declare-fun condMapEmpty!19476 () Bool)

(declare-fun mapDefault!19476 () ValueCell!5605)

