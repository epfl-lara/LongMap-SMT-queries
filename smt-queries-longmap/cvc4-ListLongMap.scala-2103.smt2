; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35790 () Bool)

(assert start!35790)

(declare-fun b!359498 () Bool)

(declare-fun res!199810 () Bool)

(declare-fun e!220200 () Bool)

(assert (=> b!359498 (=> (not res!199810) (not e!220200))))

(declare-datatypes ((array!20041 0))(
  ( (array!20042 (arr!9514 (Array (_ BitVec 32) (_ BitVec 64))) (size!9866 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20041)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20041 (_ BitVec 32)) Bool)

(assert (=> b!359498 (= res!199810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13872 () Bool)

(declare-fun mapRes!13872 () Bool)

(declare-fun tp!27939 () Bool)

(declare-fun e!220198 () Bool)

(assert (=> mapNonEmpty!13872 (= mapRes!13872 (and tp!27939 e!220198))))

(declare-fun mapKey!13872 () (_ BitVec 32))

(declare-datatypes ((V!11967 0))(
  ( (V!11968 (val!4166 Int)) )
))
(declare-datatypes ((ValueCell!3778 0))(
  ( (ValueCellFull!3778 (v!6360 V!11967)) (EmptyCell!3778) )
))
(declare-fun mapRest!13872 () (Array (_ BitVec 32) ValueCell!3778))

(declare-fun mapValue!13872 () ValueCell!3778)

(declare-datatypes ((array!20043 0))(
  ( (array!20044 (arr!9515 (Array (_ BitVec 32) ValueCell!3778)) (size!9867 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20043)

(assert (=> mapNonEmpty!13872 (= (arr!9515 _values!1208) (store mapRest!13872 mapKey!13872 mapValue!13872))))

(declare-fun b!359499 () Bool)

(declare-fun e!220202 () Bool)

(declare-fun tp_is_empty!8243 () Bool)

(assert (=> b!359499 (= e!220202 tp_is_empty!8243)))

(declare-fun b!359500 () Bool)

(declare-fun res!199809 () Bool)

(assert (=> b!359500 (=> (not res!199809) (not e!220200))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359500 (= res!199809 (and (= (size!9867 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9866 _keys!1456) (size!9867 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13872 () Bool)

(assert (=> mapIsEmpty!13872 mapRes!13872))

(declare-fun res!199808 () Bool)

(assert (=> start!35790 (=> (not res!199808) (not e!220200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35790 (= res!199808 (validMask!0 mask!1842))))

(assert (=> start!35790 e!220200))

(assert (=> start!35790 true))

(declare-fun e!220201 () Bool)

(declare-fun array_inv!6998 (array!20043) Bool)

(assert (=> start!35790 (and (array_inv!6998 _values!1208) e!220201)))

(declare-fun array_inv!6999 (array!20041) Bool)

(assert (=> start!35790 (array_inv!6999 _keys!1456)))

(declare-fun b!359501 () Bool)

(assert (=> b!359501 (= e!220200 false)))

(declare-fun lt!166352 () Bool)

(declare-datatypes ((List!5470 0))(
  ( (Nil!5467) (Cons!5466 (h!6322 (_ BitVec 64)) (t!10620 List!5470)) )
))
(declare-fun arrayNoDuplicates!0 (array!20041 (_ BitVec 32) List!5470) Bool)

(assert (=> b!359501 (= lt!166352 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5467))))

(declare-fun b!359502 () Bool)

(assert (=> b!359502 (= e!220201 (and e!220202 mapRes!13872))))

(declare-fun condMapEmpty!13872 () Bool)

(declare-fun mapDefault!13872 () ValueCell!3778)

