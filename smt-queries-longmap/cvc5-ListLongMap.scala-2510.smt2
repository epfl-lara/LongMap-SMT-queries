; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38878 () Bool)

(assert start!38878)

(declare-fun b!406313 () Bool)

(declare-fun res!234679 () Bool)

(declare-fun e!244182 () Bool)

(assert (=> b!406313 (=> (not res!234679) (not e!244182))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406313 (= res!234679 (validMask!0 mask!1025))))

(declare-fun res!234683 () Bool)

(assert (=> start!38878 (=> (not res!234683) (not e!244182))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24485 0))(
  ( (array!24486 (arr!11692 (Array (_ BitVec 32) (_ BitVec 64))) (size!12044 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24485)

(assert (=> start!38878 (= res!234683 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12044 _keys!709))))))

(assert (=> start!38878 e!244182))

(assert (=> start!38878 true))

(declare-datatypes ((V!14835 0))(
  ( (V!14836 (val!5193 Int)) )
))
(declare-datatypes ((ValueCell!4805 0))(
  ( (ValueCellFull!4805 (v!7440 V!14835)) (EmptyCell!4805) )
))
(declare-datatypes ((array!24487 0))(
  ( (array!24488 (arr!11693 (Array (_ BitVec 32) ValueCell!4805)) (size!12045 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24487)

(declare-fun e!244181 () Bool)

(declare-fun array_inv!8538 (array!24487) Bool)

(assert (=> start!38878 (and (array_inv!8538 _values!549) e!244181)))

(declare-fun array_inv!8539 (array!24485) Bool)

(assert (=> start!38878 (array_inv!8539 _keys!709)))

(declare-fun mapIsEmpty!17067 () Bool)

(declare-fun mapRes!17067 () Bool)

(assert (=> mapIsEmpty!17067 mapRes!17067))

(declare-fun b!406314 () Bool)

(declare-fun res!234678 () Bool)

(assert (=> b!406314 (=> (not res!234678) (not e!244182))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406314 (= res!234678 (or (= (select (arr!11692 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11692 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406315 () Bool)

(declare-fun res!234685 () Bool)

(assert (=> b!406315 (=> (not res!234685) (not e!244182))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406315 (= res!234685 (validKeyInArray!0 k!794))))

(declare-fun b!406316 () Bool)

(declare-fun e!244178 () Bool)

(assert (=> b!406316 (= e!244182 e!244178)))

(declare-fun res!234680 () Bool)

(assert (=> b!406316 (=> (not res!234680) (not e!244178))))

(declare-fun lt!188471 () array!24485)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24485 (_ BitVec 32)) Bool)

(assert (=> b!406316 (= res!234680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188471 mask!1025))))

(assert (=> b!406316 (= lt!188471 (array!24486 (store (arr!11692 _keys!709) i!563 k!794) (size!12044 _keys!709)))))

(declare-fun b!406317 () Bool)

(declare-fun res!234681 () Bool)

(assert (=> b!406317 (=> (not res!234681) (not e!244182))))

(declare-datatypes ((List!6791 0))(
  ( (Nil!6788) (Cons!6787 (h!7643 (_ BitVec 64)) (t!11965 List!6791)) )
))
(declare-fun arrayNoDuplicates!0 (array!24485 (_ BitVec 32) List!6791) Bool)

(assert (=> b!406317 (= res!234681 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6788))))

(declare-fun b!406318 () Bool)

(declare-fun res!234684 () Bool)

(assert (=> b!406318 (=> (not res!234684) (not e!244182))))

(assert (=> b!406318 (= res!234684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406319 () Bool)

(assert (=> b!406319 (= e!244178 false)))

(declare-fun lt!188470 () Bool)

(assert (=> b!406319 (= lt!188470 (arrayNoDuplicates!0 lt!188471 #b00000000000000000000000000000000 Nil!6788))))

(declare-fun b!406320 () Bool)

(declare-fun e!244177 () Bool)

(declare-fun tp_is_empty!10297 () Bool)

(assert (=> b!406320 (= e!244177 tp_is_empty!10297)))

(declare-fun b!406321 () Bool)

(declare-fun e!244179 () Bool)

(assert (=> b!406321 (= e!244181 (and e!244179 mapRes!17067))))

(declare-fun condMapEmpty!17067 () Bool)

(declare-fun mapDefault!17067 () ValueCell!4805)

