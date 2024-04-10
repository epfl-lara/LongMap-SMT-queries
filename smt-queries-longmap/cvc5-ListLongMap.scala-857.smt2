; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20238 () Bool)

(assert start!20238)

(declare-fun b_free!4897 () Bool)

(declare-fun b_next!4897 () Bool)

(assert (=> start!20238 (= b_free!4897 (not b_next!4897))))

(declare-fun tp!17723 () Bool)

(declare-fun b_and!11643 () Bool)

(assert (=> start!20238 (= tp!17723 b_and!11643)))

(declare-fun b!199004 () Bool)

(declare-fun e!130708 () Bool)

(declare-fun tp_is_empty!4753 () Bool)

(assert (=> b!199004 (= e!130708 tp_is_empty!4753)))

(declare-fun res!94483 () Bool)

(declare-fun e!130709 () Bool)

(assert (=> start!20238 (=> (not res!94483) (not e!130709))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20238 (= res!94483 (validMask!0 mask!1149))))

(assert (=> start!20238 e!130709))

(declare-datatypes ((V!5985 0))(
  ( (V!5986 (val!2421 Int)) )
))
(declare-datatypes ((ValueCell!2033 0))(
  ( (ValueCellFull!2033 (v!4391 V!5985)) (EmptyCell!2033) )
))
(declare-datatypes ((array!8747 0))(
  ( (array!8748 (arr!4124 (Array (_ BitVec 32) ValueCell!2033)) (size!4449 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8747)

(declare-fun e!130707 () Bool)

(declare-fun array_inv!2701 (array!8747) Bool)

(assert (=> start!20238 (and (array_inv!2701 _values!649) e!130707)))

(assert (=> start!20238 true))

(assert (=> start!20238 tp_is_empty!4753))

(declare-datatypes ((array!8749 0))(
  ( (array!8750 (arr!4125 (Array (_ BitVec 32) (_ BitVec 64))) (size!4450 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8749)

(declare-fun array_inv!2702 (array!8749) Bool)

(assert (=> start!20238 (array_inv!2702 _keys!825)))

(assert (=> start!20238 tp!17723))

(declare-fun b!199005 () Bool)

(declare-fun res!94487 () Bool)

(assert (=> b!199005 (=> (not res!94487) (not e!130709))))

(declare-datatypes ((List!2583 0))(
  ( (Nil!2580) (Cons!2579 (h!3221 (_ BitVec 64)) (t!7514 List!2583)) )
))
(declare-fun arrayNoDuplicates!0 (array!8749 (_ BitVec 32) List!2583) Bool)

(assert (=> b!199005 (= res!94487 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2580))))

(declare-fun b!199006 () Bool)

(declare-fun res!94484 () Bool)

(assert (=> b!199006 (=> (not res!94484) (not e!130709))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199006 (= res!94484 (= (select (arr!4125 _keys!825) i!601) k!843))))

(declare-fun b!199007 () Bool)

(declare-fun res!94489 () Bool)

(assert (=> b!199007 (=> (not res!94489) (not e!130709))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199007 (= res!94489 (and (= (size!4449 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4450 _keys!825) (size!4449 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8198 () Bool)

(declare-fun mapRes!8198 () Bool)

(declare-fun tp!17722 () Bool)

(declare-fun e!130706 () Bool)

(assert (=> mapNonEmpty!8198 (= mapRes!8198 (and tp!17722 e!130706))))

(declare-fun mapRest!8198 () (Array (_ BitVec 32) ValueCell!2033))

(declare-fun mapValue!8198 () ValueCell!2033)

(declare-fun mapKey!8198 () (_ BitVec 32))

(assert (=> mapNonEmpty!8198 (= (arr!4124 _values!649) (store mapRest!8198 mapKey!8198 mapValue!8198))))

(declare-fun mapIsEmpty!8198 () Bool)

(assert (=> mapIsEmpty!8198 mapRes!8198))

(declare-fun b!199008 () Bool)

(declare-fun res!94485 () Bool)

(assert (=> b!199008 (=> (not res!94485) (not e!130709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199008 (= res!94485 (validKeyInArray!0 k!843))))

(declare-fun b!199009 () Bool)

(assert (=> b!199009 (= e!130707 (and e!130708 mapRes!8198))))

(declare-fun condMapEmpty!8198 () Bool)

(declare-fun mapDefault!8198 () ValueCell!2033)

