; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82534 () Bool)

(assert start!82534)

(declare-fun b!961790 () Bool)

(declare-fun res!643657 () Bool)

(declare-fun e!542390 () Bool)

(assert (=> b!961790 (=> (not res!643657) (not e!542390))))

(declare-datatypes ((array!59035 0))(
  ( (array!59036 (arr!28386 (Array (_ BitVec 32) (_ BitVec 64))) (size!28865 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59035)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!961790 (= res!643657 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28865 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28865 _keys!1686))))))

(declare-fun b!961791 () Bool)

(declare-fun e!542386 () Bool)

(declare-fun tp_is_empty!21469 () Bool)

(assert (=> b!961791 (= e!542386 tp_is_empty!21469)))

(declare-fun b!961792 () Bool)

(declare-fun res!643653 () Bool)

(assert (=> b!961792 (=> (not res!643653) (not e!542390))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59035 (_ BitVec 32)) Bool)

(assert (=> b!961792 (= res!643653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961793 () Bool)

(declare-fun e!542387 () Bool)

(assert (=> b!961793 (= e!542387 tp_is_empty!21469)))

(declare-fun mapIsEmpty!34198 () Bool)

(declare-fun mapRes!34198 () Bool)

(assert (=> mapIsEmpty!34198 mapRes!34198))

(declare-fun b!961794 () Bool)

(declare-fun res!643656 () Bool)

(assert (=> b!961794 (=> (not res!643656) (not e!542390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961794 (= res!643656 (validKeyInArray!0 (select (arr!28386 _keys!1686) i!803)))))

(declare-fun b!961795 () Bool)

(declare-fun res!643655 () Bool)

(assert (=> b!961795 (=> (not res!643655) (not e!542390))))

(declare-datatypes ((List!19703 0))(
  ( (Nil!19700) (Cons!19699 (h!20861 (_ BitVec 64)) (t!28066 List!19703)) )
))
(declare-fun arrayNoDuplicates!0 (array!59035 (_ BitVec 32) List!19703) Bool)

(assert (=> b!961795 (= res!643655 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19700))))

(declare-fun b!961796 () Bool)

(declare-fun e!542389 () Bool)

(assert (=> b!961796 (= e!542389 (and e!542387 mapRes!34198))))

(declare-fun condMapEmpty!34198 () Bool)

(declare-datatypes ((V!33609 0))(
  ( (V!33610 (val!10785 Int)) )
))
(declare-datatypes ((ValueCell!10253 0))(
  ( (ValueCellFull!10253 (v!13343 V!33609)) (EmptyCell!10253) )
))
(declare-datatypes ((array!59037 0))(
  ( (array!59038 (arr!28387 (Array (_ BitVec 32) ValueCell!10253)) (size!28866 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59037)

(declare-fun mapDefault!34198 () ValueCell!10253)

