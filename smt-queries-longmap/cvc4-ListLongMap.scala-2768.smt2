; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40464 () Bool)

(assert start!40464)

(declare-fun res!264279 () Bool)

(declare-fun e!261814 () Bool)

(assert (=> start!40464 (=> (not res!264279) (not e!261814))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27505 0))(
  ( (array!27506 (arr!13200 (Array (_ BitVec 32) (_ BitVec 64))) (size!13552 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27505)

(assert (=> start!40464 (= res!264279 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13552 _keys!709))))))

(assert (=> start!40464 e!261814))

(assert (=> start!40464 true))

(declare-datatypes ((V!16903 0))(
  ( (V!16904 (val!5969 Int)) )
))
(declare-datatypes ((ValueCell!5581 0))(
  ( (ValueCellFull!5581 (v!8220 V!16903)) (EmptyCell!5581) )
))
(declare-datatypes ((array!27507 0))(
  ( (array!27508 (arr!13201 (Array (_ BitVec 32) ValueCell!5581)) (size!13553 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27507)

(declare-fun e!261816 () Bool)

(declare-fun array_inv!9570 (array!27507) Bool)

(assert (=> start!40464 (and (array_inv!9570 _values!549) e!261816)))

(declare-fun array_inv!9571 (array!27505) Bool)

(assert (=> start!40464 (array_inv!9571 _keys!709)))

(declare-fun b!445402 () Bool)

(declare-fun res!264281 () Bool)

(assert (=> b!445402 (=> (not res!264281) (not e!261814))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445402 (= res!264281 (or (= (select (arr!13200 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13200 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445403 () Bool)

(declare-fun res!264280 () Bool)

(assert (=> b!445403 (=> (not res!264280) (not e!261814))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27505 (_ BitVec 32)) Bool)

(assert (=> b!445403 (= res!264280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445404 () Bool)

(declare-fun res!264282 () Bool)

(assert (=> b!445404 (=> (not res!264282) (not e!261814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445404 (= res!264282 (validMask!0 mask!1025))))

(declare-fun b!445405 () Bool)

(declare-fun res!264286 () Bool)

(declare-fun e!261815 () Bool)

(assert (=> b!445405 (=> (not res!264286) (not e!261815))))

(declare-fun lt!203630 () array!27505)

(declare-datatypes ((List!7890 0))(
  ( (Nil!7887) (Cons!7886 (h!8742 (_ BitVec 64)) (t!13648 List!7890)) )
))
(declare-fun arrayNoDuplicates!0 (array!27505 (_ BitVec 32) List!7890) Bool)

(assert (=> b!445405 (= res!264286 (arrayNoDuplicates!0 lt!203630 #b00000000000000000000000000000000 Nil!7887))))

(declare-fun b!445406 () Bool)

(assert (=> b!445406 (= e!261814 e!261815)))

(declare-fun res!264288 () Bool)

(assert (=> b!445406 (=> (not res!264288) (not e!261815))))

(assert (=> b!445406 (= res!264288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203630 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!445406 (= lt!203630 (array!27506 (store (arr!13200 _keys!709) i!563 k!794) (size!13552 _keys!709)))))

(declare-fun b!445407 () Bool)

(declare-fun res!264287 () Bool)

(assert (=> b!445407 (=> (not res!264287) (not e!261814))))

(assert (=> b!445407 (= res!264287 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7887))))

(declare-fun mapIsEmpty!19401 () Bool)

(declare-fun mapRes!19401 () Bool)

(assert (=> mapIsEmpty!19401 mapRes!19401))

(declare-fun b!445408 () Bool)

(declare-fun e!261813 () Bool)

(assert (=> b!445408 (= e!261816 (and e!261813 mapRes!19401))))

(declare-fun condMapEmpty!19401 () Bool)

(declare-fun mapDefault!19401 () ValueCell!5581)

