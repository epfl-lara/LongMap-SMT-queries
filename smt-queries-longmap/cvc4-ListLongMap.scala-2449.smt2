; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38516 () Bool)

(assert start!38516)

(declare-fun mapIsEmpty!16524 () Bool)

(declare-fun mapRes!16524 () Bool)

(assert (=> mapIsEmpty!16524 mapRes!16524))

(declare-fun mapNonEmpty!16524 () Bool)

(declare-fun tp!32319 () Bool)

(declare-fun e!240600 () Bool)

(assert (=> mapNonEmpty!16524 (= mapRes!16524 (and tp!32319 e!240600))))

(declare-datatypes ((V!14351 0))(
  ( (V!14352 (val!5012 Int)) )
))
(declare-datatypes ((ValueCell!4624 0))(
  ( (ValueCellFull!4624 (v!7259 V!14351)) (EmptyCell!4624) )
))
(declare-fun mapValue!16524 () ValueCell!4624)

(declare-fun mapKey!16524 () (_ BitVec 32))

(declare-datatypes ((array!23781 0))(
  ( (array!23782 (arr!11340 (Array (_ BitVec 32) ValueCell!4624)) (size!11692 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23781)

(declare-fun mapRest!16524 () (Array (_ BitVec 32) ValueCell!4624))

(assert (=> mapNonEmpty!16524 (= (arr!11340 _values!549) (store mapRest!16524 mapKey!16524 mapValue!16524))))

(declare-fun b!397958 () Bool)

(declare-fun res!228606 () Bool)

(declare-fun e!240595 () Bool)

(assert (=> b!397958 (=> (not res!228606) (not e!240595))))

(declare-datatypes ((array!23783 0))(
  ( (array!23784 (arr!11341 (Array (_ BitVec 32) (_ BitVec 64))) (size!11693 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23783)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397958 (= res!228606 (or (= (select (arr!11341 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11341 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397959 () Bool)

(declare-fun res!228607 () Bool)

(assert (=> b!397959 (=> (not res!228607) (not e!240595))))

(declare-datatypes ((List!6561 0))(
  ( (Nil!6558) (Cons!6557 (h!7413 (_ BitVec 64)) (t!11735 List!6561)) )
))
(declare-fun arrayNoDuplicates!0 (array!23783 (_ BitVec 32) List!6561) Bool)

(assert (=> b!397959 (= res!228607 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6558))))

(declare-fun b!397960 () Bool)

(declare-fun res!228601 () Bool)

(assert (=> b!397960 (=> (not res!228601) (not e!240595))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397960 (= res!228601 (validKeyInArray!0 k!794))))

(declare-fun b!397961 () Bool)

(declare-fun e!240598 () Bool)

(assert (=> b!397961 (= e!240595 e!240598)))

(declare-fun res!228605 () Bool)

(assert (=> b!397961 (=> (not res!228605) (not e!240598))))

(declare-fun lt!187385 () array!23783)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23783 (_ BitVec 32)) Bool)

(assert (=> b!397961 (= res!228605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187385 mask!1025))))

(assert (=> b!397961 (= lt!187385 (array!23784 (store (arr!11341 _keys!709) i!563 k!794) (size!11693 _keys!709)))))

(declare-fun b!397963 () Bool)

(assert (=> b!397963 (= e!240598 false)))

(declare-fun lt!187384 () Bool)

(assert (=> b!397963 (= lt!187384 (arrayNoDuplicates!0 lt!187385 #b00000000000000000000000000000000 Nil!6558))))

(declare-fun b!397964 () Bool)

(declare-fun e!240599 () Bool)

(declare-fun tp_is_empty!9935 () Bool)

(assert (=> b!397964 (= e!240599 tp_is_empty!9935)))

(declare-fun b!397965 () Bool)

(assert (=> b!397965 (= e!240600 tp_is_empty!9935)))

(declare-fun b!397966 () Bool)

(declare-fun res!228602 () Bool)

(assert (=> b!397966 (=> (not res!228602) (not e!240595))))

(declare-fun arrayContainsKey!0 (array!23783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397966 (= res!228602 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!397962 () Bool)

(declare-fun res!228608 () Bool)

(assert (=> b!397962 (=> (not res!228608) (not e!240595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397962 (= res!228608 (validMask!0 mask!1025))))

(declare-fun res!228604 () Bool)

(assert (=> start!38516 (=> (not res!228604) (not e!240595))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38516 (= res!228604 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11693 _keys!709))))))

(assert (=> start!38516 e!240595))

(assert (=> start!38516 true))

(declare-fun e!240596 () Bool)

(declare-fun array_inv!8312 (array!23781) Bool)

(assert (=> start!38516 (and (array_inv!8312 _values!549) e!240596)))

(declare-fun array_inv!8313 (array!23783) Bool)

(assert (=> start!38516 (array_inv!8313 _keys!709)))

(declare-fun b!397967 () Bool)

(declare-fun res!228609 () Bool)

(assert (=> b!397967 (=> (not res!228609) (not e!240595))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397967 (= res!228609 (and (= (size!11692 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11693 _keys!709) (size!11692 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397968 () Bool)

(declare-fun res!228600 () Bool)

(assert (=> b!397968 (=> (not res!228600) (not e!240595))))

(assert (=> b!397968 (= res!228600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397969 () Bool)

(declare-fun res!228603 () Bool)

(assert (=> b!397969 (=> (not res!228603) (not e!240595))))

(assert (=> b!397969 (= res!228603 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11693 _keys!709))))))

(declare-fun b!397970 () Bool)

(assert (=> b!397970 (= e!240596 (and e!240599 mapRes!16524))))

(declare-fun condMapEmpty!16524 () Bool)

(declare-fun mapDefault!16524 () ValueCell!4624)

