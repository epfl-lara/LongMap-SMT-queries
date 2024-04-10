; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41232 () Bool)

(assert start!41232)

(declare-fun b_free!11075 () Bool)

(declare-fun b_next!11075 () Bool)

(assert (=> start!41232 (= b_free!11075 (not b_next!11075))))

(declare-fun tp!39064 () Bool)

(declare-fun b_and!19395 () Bool)

(assert (=> start!41232 (= tp!39064 b_and!19395)))

(declare-fun b!461196 () Bool)

(declare-fun res!275819 () Bool)

(declare-fun e!269012 () Bool)

(assert (=> b!461196 (=> (not res!275819) (not e!269012))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461196 (= res!275819 (validMask!0 mask!1025))))

(declare-fun b!461197 () Bool)

(declare-fun res!275820 () Bool)

(declare-fun e!269008 () Bool)

(assert (=> b!461197 (=> (not res!275820) (not e!269008))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461197 (= res!275820 (bvsle from!863 i!563))))

(declare-fun b!461198 () Bool)

(declare-fun e!269009 () Bool)

(declare-datatypes ((V!17655 0))(
  ( (V!17656 (val!6251 Int)) )
))
(declare-datatypes ((ValueCell!5863 0))(
  ( (ValueCellFull!5863 (v!8533 V!17655)) (EmptyCell!5863) )
))
(declare-datatypes ((array!28625 0))(
  ( (array!28626 (arr!13752 (Array (_ BitVec 32) ValueCell!5863)) (size!14104 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28625)

(assert (=> b!461198 (= e!269009 (bvslt i!563 (size!14104 _values!549)))))

(declare-fun b!461199 () Bool)

(assert (=> b!461199 (= e!269012 e!269008)))

(declare-fun res!275831 () Bool)

(assert (=> b!461199 (=> (not res!275831) (not e!269008))))

(declare-datatypes ((array!28627 0))(
  ( (array!28628 (arr!13753 (Array (_ BitVec 32) (_ BitVec 64))) (size!14105 (_ BitVec 32))) )
))
(declare-fun lt!208913 () array!28627)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28627 (_ BitVec 32)) Bool)

(assert (=> b!461199 (= res!275831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208913 mask!1025))))

(declare-fun _keys!709 () array!28627)

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!461199 (= lt!208913 (array!28628 (store (arr!13753 _keys!709) i!563 k!794) (size!14105 _keys!709)))))

(declare-fun b!461200 () Bool)

(declare-fun res!275826 () Bool)

(assert (=> b!461200 (=> (not res!275826) (not e!269012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461200 (= res!275826 (validKeyInArray!0 k!794))))

(declare-fun b!461201 () Bool)

(declare-fun res!275830 () Bool)

(assert (=> b!461201 (=> (not res!275830) (not e!269012))))

(declare-fun arrayContainsKey!0 (array!28627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461201 (= res!275830 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20272 () Bool)

(declare-fun mapRes!20272 () Bool)

(assert (=> mapIsEmpty!20272 mapRes!20272))

(declare-fun mapNonEmpty!20272 () Bool)

(declare-fun tp!39063 () Bool)

(declare-fun e!269005 () Bool)

(assert (=> mapNonEmpty!20272 (= mapRes!20272 (and tp!39063 e!269005))))

(declare-fun mapRest!20272 () (Array (_ BitVec 32) ValueCell!5863))

(declare-fun mapKey!20272 () (_ BitVec 32))

(declare-fun mapValue!20272 () ValueCell!5863)

(assert (=> mapNonEmpty!20272 (= (arr!13752 _values!549) (store mapRest!20272 mapKey!20272 mapValue!20272))))

(declare-fun b!461202 () Bool)

(declare-fun res!275818 () Bool)

(assert (=> b!461202 (=> (not res!275818) (not e!269008))))

(declare-datatypes ((List!8321 0))(
  ( (Nil!8318) (Cons!8317 (h!9173 (_ BitVec 64)) (t!14263 List!8321)) )
))
(declare-fun arrayNoDuplicates!0 (array!28627 (_ BitVec 32) List!8321) Bool)

(assert (=> b!461202 (= res!275818 (arrayNoDuplicates!0 lt!208913 #b00000000000000000000000000000000 Nil!8318))))

(declare-fun b!461203 () Bool)

(declare-fun res!275827 () Bool)

(assert (=> b!461203 (=> (not res!275827) (not e!269012))))

(assert (=> b!461203 (= res!275827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!275828 () Bool)

(assert (=> start!41232 (=> (not res!275828) (not e!269012))))

(assert (=> start!41232 (= res!275828 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14105 _keys!709))))))

(assert (=> start!41232 e!269012))

(declare-fun tp_is_empty!12413 () Bool)

(assert (=> start!41232 tp_is_empty!12413))

(assert (=> start!41232 tp!39064))

(assert (=> start!41232 true))

(declare-fun e!269010 () Bool)

(declare-fun array_inv!9948 (array!28625) Bool)

(assert (=> start!41232 (and (array_inv!9948 _values!549) e!269010)))

(declare-fun array_inv!9949 (array!28627) Bool)

(assert (=> start!41232 (array_inv!9949 _keys!709)))

(declare-fun b!461204 () Bool)

(declare-fun res!275823 () Bool)

(assert (=> b!461204 (=> (not res!275823) (not e!269012))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!461204 (= res!275823 (and (= (size!14104 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14105 _keys!709) (size!14104 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!461205 () Bool)

(declare-fun e!269011 () Bool)

(assert (=> b!461205 (= e!269010 (and e!269011 mapRes!20272))))

(declare-fun condMapEmpty!20272 () Bool)

(declare-fun mapDefault!20272 () ValueCell!5863)

