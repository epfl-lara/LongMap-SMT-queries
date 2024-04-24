; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134090 () Bool)

(assert start!134090)

(declare-fun b!1565394 () Bool)

(declare-fun res!1069390 () Bool)

(declare-fun e!872555 () Bool)

(assert (=> b!1565394 (=> (not res!1069390) (not e!872555))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104346 0))(
  ( (array!104347 (arr!50358 (Array (_ BitVec 32) (_ BitVec 64))) (size!50909 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104346)

(declare-datatypes ((V!59889 0))(
  ( (V!59890 (val!19464 Int)) )
))
(declare-datatypes ((ValueCell!18350 0))(
  ( (ValueCellFull!18350 (v!22208 V!59889)) (EmptyCell!18350) )
))
(declare-datatypes ((array!104348 0))(
  ( (array!104349 (arr!50359 (Array (_ BitVec 32) ValueCell!18350)) (size!50910 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104348)

(assert (=> b!1565394 (= res!1069390 (and (= (size!50910 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50909 _keys!637) (size!50910 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1069389 () Bool)

(assert (=> start!134090 (=> (not res!1069389) (not e!872555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134090 (= res!1069389 (validMask!0 mask!947))))

(assert (=> start!134090 e!872555))

(assert (=> start!134090 true))

(declare-fun e!872554 () Bool)

(declare-fun array_inv!39387 (array!104348) Bool)

(assert (=> start!134090 (and (array_inv!39387 _values!487) e!872554)))

(declare-fun array_inv!39388 (array!104346) Bool)

(assert (=> start!134090 (array_inv!39388 _keys!637)))

(declare-fun mapNonEmpty!59517 () Bool)

(declare-fun mapRes!59517 () Bool)

(declare-fun tp!113352 () Bool)

(declare-fun e!872557 () Bool)

(assert (=> mapNonEmpty!59517 (= mapRes!59517 (and tp!113352 e!872557))))

(declare-fun mapValue!59517 () ValueCell!18350)

(declare-fun mapRest!59517 () (Array (_ BitVec 32) ValueCell!18350))

(declare-fun mapKey!59517 () (_ BitVec 32))

(assert (=> mapNonEmpty!59517 (= (arr!50359 _values!487) (store mapRest!59517 mapKey!59517 mapValue!59517))))

(declare-fun b!1565395 () Bool)

(declare-fun tp_is_empty!38761 () Bool)

(assert (=> b!1565395 (= e!872557 tp_is_empty!38761)))

(declare-fun b!1565396 () Bool)

(declare-fun res!1069391 () Bool)

(assert (=> b!1565396 (=> (not res!1069391) (not e!872555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104346 (_ BitVec 32)) Bool)

(assert (=> b!1565396 (= res!1069391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59517 () Bool)

(assert (=> mapIsEmpty!59517 mapRes!59517))

(declare-fun b!1565397 () Bool)

(declare-fun e!872556 () Bool)

(assert (=> b!1565397 (= e!872554 (and e!872556 mapRes!59517))))

(declare-fun condMapEmpty!59517 () Bool)

(declare-fun mapDefault!59517 () ValueCell!18350)

(assert (=> b!1565397 (= condMapEmpty!59517 (= (arr!50359 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18350)) mapDefault!59517)))))

(declare-fun b!1565398 () Bool)

(assert (=> b!1565398 (= e!872555 false)))

(declare-fun lt!672719 () Bool)

(declare-datatypes ((List!36539 0))(
  ( (Nil!36536) (Cons!36535 (h!37999 (_ BitVec 64)) (t!51378 List!36539)) )
))
(declare-fun arrayNoDuplicates!0 (array!104346 (_ BitVec 32) List!36539) Bool)

(assert (=> b!1565398 (= lt!672719 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36536))))

(declare-fun b!1565399 () Bool)

(assert (=> b!1565399 (= e!872556 tp_is_empty!38761)))

(assert (= (and start!134090 res!1069389) b!1565394))

(assert (= (and b!1565394 res!1069390) b!1565396))

(assert (= (and b!1565396 res!1069391) b!1565398))

(assert (= (and b!1565397 condMapEmpty!59517) mapIsEmpty!59517))

(assert (= (and b!1565397 (not condMapEmpty!59517)) mapNonEmpty!59517))

(get-info :version)

(assert (= (and mapNonEmpty!59517 ((_ is ValueCellFull!18350) mapValue!59517)) b!1565395))

(assert (= (and b!1565397 ((_ is ValueCellFull!18350) mapDefault!59517)) b!1565399))

(assert (= start!134090 b!1565397))

(declare-fun m!1440891 () Bool)

(assert (=> start!134090 m!1440891))

(declare-fun m!1440893 () Bool)

(assert (=> start!134090 m!1440893))

(declare-fun m!1440895 () Bool)

(assert (=> start!134090 m!1440895))

(declare-fun m!1440897 () Bool)

(assert (=> mapNonEmpty!59517 m!1440897))

(declare-fun m!1440899 () Bool)

(assert (=> b!1565396 m!1440899))

(declare-fun m!1440901 () Bool)

(assert (=> b!1565398 m!1440901))

(check-sat tp_is_empty!38761 (not mapNonEmpty!59517) (not start!134090) (not b!1565396) (not b!1565398))
(check-sat)
