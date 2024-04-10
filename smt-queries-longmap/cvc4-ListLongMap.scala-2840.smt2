; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41008 () Bool)

(assert start!41008)

(declare-fun b_free!10943 () Bool)

(declare-fun b_next!10943 () Bool)

(assert (=> start!41008 (= b_free!10943 (not b_next!10943))))

(declare-fun tp!38655 () Bool)

(declare-fun b_and!19085 () Bool)

(assert (=> start!41008 (= tp!38655 b_and!19085)))

(declare-fun mapNonEmpty!20062 () Bool)

(declare-fun mapRes!20062 () Bool)

(declare-fun tp!38656 () Bool)

(declare-fun e!266899 () Bool)

(assert (=> mapNonEmpty!20062 (= mapRes!20062 (and tp!38656 e!266899))))

(declare-fun mapKey!20062 () (_ BitVec 32))

(declare-datatypes ((V!17479 0))(
  ( (V!17480 (val!6185 Int)) )
))
(declare-datatypes ((ValueCell!5797 0))(
  ( (ValueCellFull!5797 (v!8451 V!17479)) (EmptyCell!5797) )
))
(declare-fun mapValue!20062 () ValueCell!5797)

(declare-fun mapRest!20062 () (Array (_ BitVec 32) ValueCell!5797))

(declare-datatypes ((array!28363 0))(
  ( (array!28364 (arr!13625 (Array (_ BitVec 32) ValueCell!5797)) (size!13977 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28363)

(assert (=> mapNonEmpty!20062 (= (arr!13625 _values!549) (store mapRest!20062 mapKey!20062 mapValue!20062))))

(declare-fun b!456894 () Bool)

(declare-fun e!266897 () Bool)

(declare-fun tp_is_empty!12281 () Bool)

(assert (=> b!456894 (= e!266897 tp_is_empty!12281)))

(declare-fun b!456895 () Bool)

(declare-fun res!272752 () Bool)

(declare-fun e!266893 () Bool)

(assert (=> b!456895 (=> (not res!272752) (not e!266893))))

(declare-datatypes ((array!28365 0))(
  ( (array!28366 (arr!13626 (Array (_ BitVec 32) (_ BitVec 64))) (size!13978 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28365)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28365 (_ BitVec 32)) Bool)

(assert (=> b!456895 (= res!272752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456896 () Bool)

(assert (=> b!456896 (= e!266899 tp_is_empty!12281)))

(declare-fun b!456897 () Bool)

(declare-fun res!272747 () Bool)

(assert (=> b!456897 (=> (not res!272747) (not e!266893))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456897 (= res!272747 (or (= (select (arr!13626 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13626 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456898 () Bool)

(declare-fun res!272753 () Bool)

(declare-fun e!266894 () Bool)

(assert (=> b!456898 (=> (not res!272753) (not e!266894))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!456898 (= res!272753 (bvsle from!863 i!563))))

(declare-fun b!456899 () Bool)

(declare-fun e!266898 () Bool)

(assert (=> b!456899 (= e!266898 (and e!266897 mapRes!20062))))

(declare-fun condMapEmpty!20062 () Bool)

(declare-fun mapDefault!20062 () ValueCell!5797)

