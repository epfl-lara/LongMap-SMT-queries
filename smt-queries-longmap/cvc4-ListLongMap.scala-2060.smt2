; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35532 () Bool)

(assert start!35532)

(declare-fun b!356060 () Bool)

(declare-fun res!197531 () Bool)

(declare-fun e!218184 () Bool)

(assert (=> b!356060 (=> (not res!197531) (not e!218184))))

(declare-datatypes ((array!19543 0))(
  ( (array!19544 (arr!9265 (Array (_ BitVec 32) (_ BitVec 64))) (size!9617 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19543)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19543 (_ BitVec 32)) Bool)

(assert (=> b!356060 (= res!197531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356061 () Bool)

(declare-fun e!218182 () Bool)

(declare-fun tp_is_empty!7985 () Bool)

(assert (=> b!356061 (= e!218182 tp_is_empty!7985)))

(declare-fun mapIsEmpty!13485 () Bool)

(declare-fun mapRes!13485 () Bool)

(assert (=> mapIsEmpty!13485 mapRes!13485))

(declare-fun res!197533 () Bool)

(assert (=> start!35532 (=> (not res!197533) (not e!218184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35532 (= res!197533 (validMask!0 mask!1842))))

(assert (=> start!35532 e!218184))

(assert (=> start!35532 true))

(declare-datatypes ((V!11623 0))(
  ( (V!11624 (val!4037 Int)) )
))
(declare-datatypes ((ValueCell!3649 0))(
  ( (ValueCellFull!3649 (v!6231 V!11623)) (EmptyCell!3649) )
))
(declare-datatypes ((array!19545 0))(
  ( (array!19546 (arr!9266 (Array (_ BitVec 32) ValueCell!3649)) (size!9618 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19545)

(declare-fun e!218183 () Bool)

(declare-fun array_inv!6808 (array!19545) Bool)

(assert (=> start!35532 (and (array_inv!6808 _values!1208) e!218183)))

(declare-fun array_inv!6809 (array!19543) Bool)

(assert (=> start!35532 (array_inv!6809 _keys!1456)))

(declare-fun mapNonEmpty!13485 () Bool)

(declare-fun tp!27462 () Bool)

(declare-fun e!218185 () Bool)

(assert (=> mapNonEmpty!13485 (= mapRes!13485 (and tp!27462 e!218185))))

(declare-fun mapRest!13485 () (Array (_ BitVec 32) ValueCell!3649))

(declare-fun mapValue!13485 () ValueCell!3649)

(declare-fun mapKey!13485 () (_ BitVec 32))

(assert (=> mapNonEmpty!13485 (= (arr!9266 _values!1208) (store mapRest!13485 mapKey!13485 mapValue!13485))))

(declare-fun b!356062 () Bool)

(assert (=> b!356062 (= e!218185 tp_is_empty!7985)))

(declare-fun b!356063 () Bool)

(assert (=> b!356063 (= e!218184 false)))

(declare-fun lt!165893 () Bool)

(declare-datatypes ((List!5359 0))(
  ( (Nil!5356) (Cons!5355 (h!6211 (_ BitVec 64)) (t!10509 List!5359)) )
))
(declare-fun arrayNoDuplicates!0 (array!19543 (_ BitVec 32) List!5359) Bool)

(assert (=> b!356063 (= lt!165893 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5356))))

(declare-fun b!356064 () Bool)

(declare-fun res!197532 () Bool)

(assert (=> b!356064 (=> (not res!197532) (not e!218184))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356064 (= res!197532 (and (= (size!9618 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9617 _keys!1456) (size!9618 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356065 () Bool)

(assert (=> b!356065 (= e!218183 (and e!218182 mapRes!13485))))

(declare-fun condMapEmpty!13485 () Bool)

(declare-fun mapDefault!13485 () ValueCell!3649)

