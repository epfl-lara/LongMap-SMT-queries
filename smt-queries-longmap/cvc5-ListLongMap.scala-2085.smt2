; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35678 () Bool)

(assert start!35678)

(declare-fun mapIsEmpty!13704 () Bool)

(declare-fun mapRes!13704 () Bool)

(assert (=> mapIsEmpty!13704 mapRes!13704))

(declare-fun b!358391 () Bool)

(declare-fun e!219361 () Bool)

(assert (=> b!358391 (= e!219361 false)))

(declare-fun lt!166184 () Bool)

(declare-datatypes ((array!19827 0))(
  ( (array!19828 (arr!9407 (Array (_ BitVec 32) (_ BitVec 64))) (size!9759 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19827)

(declare-datatypes ((List!5428 0))(
  ( (Nil!5425) (Cons!5424 (h!6280 (_ BitVec 64)) (t!10578 List!5428)) )
))
(declare-fun arrayNoDuplicates!0 (array!19827 (_ BitVec 32) List!5428) Bool)

(assert (=> b!358391 (= lt!166184 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5425))))

(declare-fun b!358392 () Bool)

(declare-fun res!199207 () Bool)

(assert (=> b!358392 (=> (not res!199207) (not e!219361))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11819 0))(
  ( (V!11820 (val!4110 Int)) )
))
(declare-datatypes ((ValueCell!3722 0))(
  ( (ValueCellFull!3722 (v!6304 V!11819)) (EmptyCell!3722) )
))
(declare-datatypes ((array!19829 0))(
  ( (array!19830 (arr!9408 (Array (_ BitVec 32) ValueCell!3722)) (size!9760 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19829)

(assert (=> b!358392 (= res!199207 (and (= (size!9760 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9759 _keys!1456) (size!9760 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358393 () Bool)

(declare-fun res!199205 () Bool)

(assert (=> b!358393 (=> (not res!199205) (not e!219361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19827 (_ BitVec 32)) Bool)

(assert (=> b!358393 (= res!199205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199206 () Bool)

(assert (=> start!35678 (=> (not res!199206) (not e!219361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35678 (= res!199206 (validMask!0 mask!1842))))

(assert (=> start!35678 e!219361))

(assert (=> start!35678 true))

(declare-fun e!219362 () Bool)

(declare-fun array_inv!6916 (array!19829) Bool)

(assert (=> start!35678 (and (array_inv!6916 _values!1208) e!219362)))

(declare-fun array_inv!6917 (array!19827) Bool)

(assert (=> start!35678 (array_inv!6917 _keys!1456)))

(declare-fun b!358394 () Bool)

(declare-fun e!219358 () Bool)

(declare-fun tp_is_empty!8131 () Bool)

(assert (=> b!358394 (= e!219358 tp_is_empty!8131)))

(declare-fun b!358395 () Bool)

(declare-fun e!219359 () Bool)

(assert (=> b!358395 (= e!219362 (and e!219359 mapRes!13704))))

(declare-fun condMapEmpty!13704 () Bool)

(declare-fun mapDefault!13704 () ValueCell!3722)

