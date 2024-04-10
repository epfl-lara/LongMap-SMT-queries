; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82546 () Bool)

(assert start!82546)

(declare-fun b_free!18679 () Bool)

(declare-fun b_next!18679 () Bool)

(assert (=> start!82546 (= b_free!18679 (not b_next!18679))))

(declare-fun tp!65157 () Bool)

(declare-fun b_and!30167 () Bool)

(assert (=> start!82546 (= tp!65157 b_and!30167)))

(declare-fun b!961952 () Bool)

(declare-fun res!643765 () Bool)

(declare-fun e!542479 () Bool)

(assert (=> b!961952 (=> (not res!643765) (not e!542479))))

(declare-datatypes ((array!59059 0))(
  ( (array!59060 (arr!28398 (Array (_ BitVec 32) (_ BitVec 64))) (size!28877 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59059)

(declare-datatypes ((List!19708 0))(
  ( (Nil!19705) (Cons!19704 (h!20866 (_ BitVec 64)) (t!28071 List!19708)) )
))
(declare-fun arrayNoDuplicates!0 (array!59059 (_ BitVec 32) List!19708) Bool)

(assert (=> b!961952 (= res!643765 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19705))))

(declare-fun b!961953 () Bool)

(declare-fun res!643764 () Bool)

(assert (=> b!961953 (=> (not res!643764) (not e!542479))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59059 (_ BitVec 32)) Bool)

(assert (=> b!961953 (= res!643764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961954 () Bool)

(declare-fun res!643760 () Bool)

(assert (=> b!961954 (=> (not res!643760) (not e!542479))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33625 0))(
  ( (V!33626 (val!10791 Int)) )
))
(declare-datatypes ((ValueCell!10259 0))(
  ( (ValueCellFull!10259 (v!13349 V!33625)) (EmptyCell!10259) )
))
(declare-datatypes ((array!59061 0))(
  ( (array!59062 (arr!28399 (Array (_ BitVec 32) ValueCell!10259)) (size!28878 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59061)

(assert (=> b!961954 (= res!643760 (and (= (size!28878 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28877 _keys!1686) (size!28878 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961955 () Bool)

(declare-fun e!542478 () Bool)

(declare-fun tp_is_empty!21481 () Bool)

(assert (=> b!961955 (= e!542478 tp_is_empty!21481)))

(declare-fun b!961956 () Bool)

(assert (=> b!961956 (= e!542479 false)))

(declare-fun minValue!1342 () V!33625)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!430822 () Bool)

(declare-fun zeroValue!1342 () V!33625)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13860 0))(
  ( (tuple2!13861 (_1!6941 (_ BitVec 64)) (_2!6941 V!33625)) )
))
(declare-datatypes ((List!19709 0))(
  ( (Nil!19706) (Cons!19705 (h!20867 tuple2!13860) (t!28072 List!19709)) )
))
(declare-datatypes ((ListLongMap!12557 0))(
  ( (ListLongMap!12558 (toList!6294 List!19709)) )
))
(declare-fun contains!5397 (ListLongMap!12557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3527 (array!59059 array!59061 (_ BitVec 32) (_ BitVec 32) V!33625 V!33625 (_ BitVec 32) Int) ListLongMap!12557)

(assert (=> b!961956 (= lt!430822 (contains!5397 (getCurrentListMap!3527 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28398 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34216 () Bool)

(declare-fun mapRes!34216 () Bool)

(assert (=> mapIsEmpty!34216 mapRes!34216))

(declare-fun b!961957 () Bool)

(declare-fun res!643762 () Bool)

(assert (=> b!961957 (=> (not res!643762) (not e!542479))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!961957 (= res!643762 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28877 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28877 _keys!1686))))))

(declare-fun res!643761 () Bool)

(assert (=> start!82546 (=> (not res!643761) (not e!542479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82546 (= res!643761 (validMask!0 mask!2110))))

(assert (=> start!82546 e!542479))

(assert (=> start!82546 true))

(declare-fun e!542476 () Bool)

(declare-fun array_inv!22007 (array!59061) Bool)

(assert (=> start!82546 (and (array_inv!22007 _values!1400) e!542476)))

(declare-fun array_inv!22008 (array!59059) Bool)

(assert (=> start!82546 (array_inv!22008 _keys!1686)))

(assert (=> start!82546 tp!65157))

(assert (=> start!82546 tp_is_empty!21481))

(declare-fun mapNonEmpty!34216 () Bool)

(declare-fun tp!65156 () Bool)

(assert (=> mapNonEmpty!34216 (= mapRes!34216 (and tp!65156 e!542478))))

(declare-fun mapRest!34216 () (Array (_ BitVec 32) ValueCell!10259))

(declare-fun mapKey!34216 () (_ BitVec 32))

(declare-fun mapValue!34216 () ValueCell!10259)

(assert (=> mapNonEmpty!34216 (= (arr!28399 _values!1400) (store mapRest!34216 mapKey!34216 mapValue!34216))))

(declare-fun b!961958 () Bool)

(declare-fun e!542477 () Bool)

(assert (=> b!961958 (= e!542477 tp_is_empty!21481)))

(declare-fun b!961959 () Bool)

(assert (=> b!961959 (= e!542476 (and e!542477 mapRes!34216))))

(declare-fun condMapEmpty!34216 () Bool)

(declare-fun mapDefault!34216 () ValueCell!10259)

