; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38906 () Bool)

(assert start!38906)

(declare-fun b!406859 () Bool)

(declare-fun e!244430 () Bool)

(assert (=> b!406859 (= e!244430 false)))

(declare-fun lt!188554 () Bool)

(declare-datatypes ((array!24537 0))(
  ( (array!24538 (arr!11718 (Array (_ BitVec 32) (_ BitVec 64))) (size!12070 (_ BitVec 32))) )
))
(declare-fun lt!188555 () array!24537)

(declare-datatypes ((List!6802 0))(
  ( (Nil!6799) (Cons!6798 (h!7654 (_ BitVec 64)) (t!11976 List!6802)) )
))
(declare-fun arrayNoDuplicates!0 (array!24537 (_ BitVec 32) List!6802) Bool)

(assert (=> b!406859 (= lt!188554 (arrayNoDuplicates!0 lt!188555 #b00000000000000000000000000000000 Nil!6799))))

(declare-fun b!406860 () Bool)

(declare-fun e!244434 () Bool)

(declare-fun tp_is_empty!10325 () Bool)

(assert (=> b!406860 (= e!244434 tp_is_empty!10325)))

(declare-fun b!406861 () Bool)

(declare-fun res!235105 () Bool)

(declare-fun e!244431 () Bool)

(assert (=> b!406861 (=> (not res!235105) (not e!244431))))

(declare-fun _keys!709 () array!24537)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406861 (= res!235105 (or (= (select (arr!11718 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11718 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406863 () Bool)

(declare-fun res!235107 () Bool)

(assert (=> b!406863 (=> (not res!235107) (not e!244431))))

(assert (=> b!406863 (= res!235107 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6799))))

(declare-fun b!406864 () Bool)

(declare-fun res!235103 () Bool)

(assert (=> b!406864 (=> (not res!235103) (not e!244431))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14871 0))(
  ( (V!14872 (val!5207 Int)) )
))
(declare-datatypes ((ValueCell!4819 0))(
  ( (ValueCellFull!4819 (v!7454 V!14871)) (EmptyCell!4819) )
))
(declare-datatypes ((array!24539 0))(
  ( (array!24540 (arr!11719 (Array (_ BitVec 32) ValueCell!4819)) (size!12071 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24539)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!406864 (= res!235103 (and (= (size!12071 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12070 _keys!709) (size!12071 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406865 () Bool)

(declare-fun res!235102 () Bool)

(assert (=> b!406865 (=> (not res!235102) (not e!244431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406865 (= res!235102 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17109 () Bool)

(declare-fun mapRes!17109 () Bool)

(declare-fun tp!33228 () Bool)

(declare-fun e!244432 () Bool)

(assert (=> mapNonEmpty!17109 (= mapRes!17109 (and tp!33228 e!244432))))

(declare-fun mapValue!17109 () ValueCell!4819)

(declare-fun mapKey!17109 () (_ BitVec 32))

(declare-fun mapRest!17109 () (Array (_ BitVec 32) ValueCell!4819))

(assert (=> mapNonEmpty!17109 (= (arr!11719 _values!549) (store mapRest!17109 mapKey!17109 mapValue!17109))))

(declare-fun b!406866 () Bool)

(declare-fun res!235099 () Bool)

(assert (=> b!406866 (=> (not res!235099) (not e!244431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24537 (_ BitVec 32)) Bool)

(assert (=> b!406866 (= res!235099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406867 () Bool)

(declare-fun res!235098 () Bool)

(assert (=> b!406867 (=> (not res!235098) (not e!244431))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406867 (= res!235098 (validKeyInArray!0 k!794))))

(declare-fun b!406868 () Bool)

(declare-fun e!244429 () Bool)

(assert (=> b!406868 (= e!244429 (and e!244434 mapRes!17109))))

(declare-fun condMapEmpty!17109 () Bool)

(declare-fun mapDefault!17109 () ValueCell!4819)

