; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39920 () Bool)

(assert start!39920)

(declare-fun b_free!10187 () Bool)

(declare-fun b_next!10187 () Bool)

(assert (=> start!39920 (= b_free!10187 (not b_next!10187))))

(declare-fun tp!36090 () Bool)

(declare-fun b_and!18033 () Bool)

(assert (=> start!39920 (= tp!36090 b_and!18033)))

(declare-fun mapIsEmpty!18630 () Bool)

(declare-fun mapRes!18630 () Bool)

(assert (=> mapIsEmpty!18630 mapRes!18630))

(declare-fun b!432998 () Bool)

(declare-fun res!254781 () Bool)

(declare-fun e!256070 () Bool)

(assert (=> b!432998 (=> (not res!254781) (not e!256070))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26511 0))(
  ( (array!26512 (arr!12705 (Array (_ BitVec 32) (_ BitVec 64))) (size!13057 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26511)

(assert (=> b!432998 (= res!254781 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13057 _keys!709))))))

(declare-fun b!432999 () Bool)

(declare-fun res!254780 () Bool)

(assert (=> b!432999 (=> (not res!254780) (not e!256070))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432999 (= res!254780 (validKeyInArray!0 k!794))))

(declare-fun b!433000 () Bool)

(declare-fun e!256067 () Bool)

(assert (=> b!433000 (= e!256067 true)))

(declare-datatypes ((V!16223 0))(
  ( (V!16224 (val!5714 Int)) )
))
(declare-datatypes ((tuple2!7546 0))(
  ( (tuple2!7547 (_1!3784 (_ BitVec 64)) (_2!3784 V!16223)) )
))
(declare-fun lt!198723 () tuple2!7546)

(declare-datatypes ((List!7558 0))(
  ( (Nil!7555) (Cons!7554 (h!8410 tuple2!7546) (t!13194 List!7558)) )
))
(declare-datatypes ((ListLongMap!6459 0))(
  ( (ListLongMap!6460 (toList!3245 List!7558)) )
))
(declare-fun lt!198721 () ListLongMap!6459)

(declare-fun lt!198724 () ListLongMap!6459)

(declare-fun lt!198722 () tuple2!7546)

(declare-fun +!1393 (ListLongMap!6459 tuple2!7546) ListLongMap!6459)

(assert (=> b!433000 (= lt!198724 (+!1393 (+!1393 lt!198721 lt!198723) lt!198722))))

(declare-datatypes ((Unit!12804 0))(
  ( (Unit!12805) )
))
(declare-fun lt!198720 () Unit!12804)

(declare-fun v!412 () V!16223)

(declare-fun lt!198713 () V!16223)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!382 (ListLongMap!6459 (_ BitVec 64) V!16223 (_ BitVec 64) V!16223) Unit!12804)

(assert (=> b!433000 (= lt!198720 (addCommutativeForDiffKeys!382 lt!198721 k!794 v!412 (select (arr!12705 _keys!709) from!863) lt!198713))))

(declare-fun b!433001 () Bool)

(declare-fun e!256068 () Unit!12804)

(declare-fun Unit!12806 () Unit!12804)

(assert (=> b!433001 (= e!256068 Unit!12806)))

(declare-fun res!254777 () Bool)

(assert (=> start!39920 (=> (not res!254777) (not e!256070))))

(assert (=> start!39920 (= res!254777 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13057 _keys!709))))))

(assert (=> start!39920 e!256070))

(declare-fun tp_is_empty!11339 () Bool)

(assert (=> start!39920 tp_is_empty!11339))

(assert (=> start!39920 tp!36090))

(assert (=> start!39920 true))

(declare-datatypes ((ValueCell!5326 0))(
  ( (ValueCellFull!5326 (v!7961 V!16223)) (EmptyCell!5326) )
))
(declare-datatypes ((array!26513 0))(
  ( (array!26514 (arr!12706 (Array (_ BitVec 32) ValueCell!5326)) (size!13058 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26513)

(declare-fun e!256064 () Bool)

(declare-fun array_inv!9244 (array!26513) Bool)

(assert (=> start!39920 (and (array_inv!9244 _values!549) e!256064)))

(declare-fun array_inv!9245 (array!26511) Bool)

(assert (=> start!39920 (array_inv!9245 _keys!709)))

(declare-fun b!433002 () Bool)

(declare-fun res!254786 () Bool)

(assert (=> b!433002 (=> (not res!254786) (not e!256070))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26511 (_ BitVec 32)) Bool)

(assert (=> b!433002 (= res!254786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433003 () Bool)

(declare-fun res!254776 () Bool)

(assert (=> b!433003 (=> (not res!254776) (not e!256070))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!433003 (= res!254776 (and (= (size!13058 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13057 _keys!709) (size!13058 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433004 () Bool)

(declare-fun e!256063 () Bool)

(assert (=> b!433004 (= e!256063 tp_is_empty!11339)))

(declare-fun b!433005 () Bool)

(assert (=> b!433005 (= e!256064 (and e!256063 mapRes!18630))))

(declare-fun condMapEmpty!18630 () Bool)

(declare-fun mapDefault!18630 () ValueCell!5326)

