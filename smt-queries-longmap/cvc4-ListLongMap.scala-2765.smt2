; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40446 () Bool)

(assert start!40446)

(declare-fun b!445043 () Bool)

(declare-fun res!264008 () Bool)

(declare-fun e!261653 () Bool)

(assert (=> b!445043 (=> (not res!264008) (not e!261653))))

(declare-datatypes ((array!27469 0))(
  ( (array!27470 (arr!13182 (Array (_ BitVec 32) (_ BitVec 64))) (size!13534 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27469)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445043 (= res!264008 (or (= (select (arr!13182 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13182 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445044 () Bool)

(declare-fun res!264010 () Bool)

(assert (=> b!445044 (=> (not res!264010) (not e!261653))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445044 (= res!264010 (validKeyInArray!0 k!794))))

(declare-fun b!445045 () Bool)

(declare-fun res!264006 () Bool)

(assert (=> b!445045 (=> (not res!264006) (not e!261653))))

(declare-datatypes ((List!7883 0))(
  ( (Nil!7880) (Cons!7879 (h!8735 (_ BitVec 64)) (t!13641 List!7883)) )
))
(declare-fun arrayNoDuplicates!0 (array!27469 (_ BitVec 32) List!7883) Bool)

(assert (=> b!445045 (= res!264006 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7880))))

(declare-fun b!445046 () Bool)

(declare-fun res!264001 () Bool)

(assert (=> b!445046 (=> (not res!264001) (not e!261653))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445046 (= res!264001 (validMask!0 mask!1025))))

(declare-fun b!445047 () Bool)

(declare-fun e!261655 () Bool)

(assert (=> b!445047 (= e!261653 e!261655)))

(declare-fun res!264004 () Bool)

(assert (=> b!445047 (=> (not res!264004) (not e!261655))))

(declare-fun lt!203585 () array!27469)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27469 (_ BitVec 32)) Bool)

(assert (=> b!445047 (= res!264004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203585 mask!1025))))

(assert (=> b!445047 (= lt!203585 (array!27470 (store (arr!13182 _keys!709) i!563 k!794) (size!13534 _keys!709)))))

(declare-fun b!445048 () Bool)

(declare-fun e!261654 () Bool)

(declare-fun e!261656 () Bool)

(declare-fun mapRes!19374 () Bool)

(assert (=> b!445048 (= e!261654 (and e!261656 mapRes!19374))))

(declare-fun condMapEmpty!19374 () Bool)

(declare-datatypes ((V!16879 0))(
  ( (V!16880 (val!5960 Int)) )
))
(declare-datatypes ((ValueCell!5572 0))(
  ( (ValueCellFull!5572 (v!8211 V!16879)) (EmptyCell!5572) )
))
(declare-datatypes ((array!27471 0))(
  ( (array!27472 (arr!13183 (Array (_ BitVec 32) ValueCell!5572)) (size!13535 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27471)

(declare-fun mapDefault!19374 () ValueCell!5572)

