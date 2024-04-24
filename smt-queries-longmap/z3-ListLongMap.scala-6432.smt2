; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82556 () Bool)

(assert start!82556)

(declare-fun b_free!18655 () Bool)

(declare-fun b_next!18655 () Bool)

(assert (=> start!82556 (= b_free!18655 (not b_next!18655))))

(declare-fun tp!64935 () Bool)

(declare-fun b_and!30153 () Bool)

(assert (=> start!82556 (= tp!64935 b_and!30153)))

(declare-fun b!961568 () Bool)

(declare-fun res!643396 () Bool)

(declare-fun e!542112 () Bool)

(assert (=> b!961568 (=> (not res!643396) (not e!542112))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33473 0))(
  ( (V!33474 (val!10734 Int)) )
))
(declare-datatypes ((ValueCell!10202 0))(
  ( (ValueCellFull!10202 (v!13288 V!33473)) (EmptyCell!10202) )
))
(declare-datatypes ((array!58856 0))(
  ( (array!58857 (arr!28297 (Array (_ BitVec 32) ValueCell!10202)) (size!28777 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58856)

(declare-datatypes ((array!58858 0))(
  ( (array!58859 (arr!28298 (Array (_ BitVec 32) (_ BitVec 64))) (size!28778 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58858)

(assert (=> b!961568 (= res!643396 (and (= (size!28777 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28778 _keys!1668) (size!28777 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!961569 () Bool)

(declare-fun e!542111 () Bool)

(declare-fun tp_is_empty!21367 () Bool)

(assert (=> b!961569 (= e!542111 tp_is_empty!21367)))

(declare-fun b!961570 () Bool)

(declare-fun res!643395 () Bool)

(assert (=> b!961570 (=> (not res!643395) (not e!542112))))

(declare-datatypes ((List!19649 0))(
  ( (Nil!19646) (Cons!19645 (h!20813 (_ BitVec 64)) (t!28004 List!19649)) )
))
(declare-fun arrayNoDuplicates!0 (array!58858 (_ BitVec 32) List!19649) Bool)

(assert (=> b!961570 (= res!643395 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19646))))

(declare-fun b!961571 () Bool)

(declare-fun e!542108 () Bool)

(declare-fun mapRes!34030 () Bool)

(assert (=> b!961571 (= e!542108 (and e!542111 mapRes!34030))))

(declare-fun condMapEmpty!34030 () Bool)

(declare-fun mapDefault!34030 () ValueCell!10202)

(assert (=> b!961571 (= condMapEmpty!34030 (= (arr!28297 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10202)) mapDefault!34030)))))

(declare-fun res!643397 () Bool)

(assert (=> start!82556 (=> (not res!643397) (not e!542112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82556 (= res!643397 (validMask!0 mask!2088))))

(assert (=> start!82556 e!542112))

(assert (=> start!82556 true))

(assert (=> start!82556 tp_is_empty!21367))

(declare-fun array_inv!22013 (array!58858) Bool)

(assert (=> start!82556 (array_inv!22013 _keys!1668)))

(declare-fun array_inv!22014 (array!58856) Bool)

(assert (=> start!82556 (and (array_inv!22014 _values!1386) e!542108)))

(assert (=> start!82556 tp!64935))

(declare-fun b!961572 () Bool)

(declare-fun e!542110 () Bool)

(assert (=> b!961572 (= e!542110 tp_is_empty!21367)))

(declare-fun b!961573 () Bool)

(declare-fun res!643398 () Bool)

(assert (=> b!961573 (=> (not res!643398) (not e!542112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58858 (_ BitVec 32)) Bool)

(assert (=> b!961573 (= res!643398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!34030 () Bool)

(assert (=> mapIsEmpty!34030 mapRes!34030))

(declare-fun b!961574 () Bool)

(declare-fun res!643394 () Bool)

(assert (=> b!961574 (=> (not res!643394) (not e!542112))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961574 (= res!643394 (validKeyInArray!0 (select (arr!28298 _keys!1668) i!793)))))

(declare-fun b!961575 () Bool)

(assert (=> b!961575 (= e!542112 false)))

(declare-fun lt!431035 () Bool)

(declare-fun minValue!1328 () V!33473)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33473)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13818 0))(
  ( (tuple2!13819 (_1!6920 (_ BitVec 64)) (_2!6920 V!33473)) )
))
(declare-datatypes ((List!19650 0))(
  ( (Nil!19647) (Cons!19646 (h!20814 tuple2!13818) (t!28005 List!19650)) )
))
(declare-datatypes ((ListLongMap!12517 0))(
  ( (ListLongMap!12518 (toList!6274 List!19650)) )
))
(declare-fun contains!5386 (ListLongMap!12517 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3507 (array!58858 array!58856 (_ BitVec 32) (_ BitVec 32) V!33473 V!33473 (_ BitVec 32) Int) ListLongMap!12517)

(assert (=> b!961575 (= lt!431035 (contains!5386 (getCurrentListMap!3507 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28298 _keys!1668) i!793)))))

(declare-fun b!961576 () Bool)

(declare-fun res!643399 () Bool)

(assert (=> b!961576 (=> (not res!643399) (not e!542112))))

(assert (=> b!961576 (= res!643399 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28778 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28778 _keys!1668))))))

(declare-fun mapNonEmpty!34030 () Bool)

(declare-fun tp!64936 () Bool)

(assert (=> mapNonEmpty!34030 (= mapRes!34030 (and tp!64936 e!542110))))

(declare-fun mapRest!34030 () (Array (_ BitVec 32) ValueCell!10202))

(declare-fun mapValue!34030 () ValueCell!10202)

(declare-fun mapKey!34030 () (_ BitVec 32))

(assert (=> mapNonEmpty!34030 (= (arr!28297 _values!1386) (store mapRest!34030 mapKey!34030 mapValue!34030))))

(assert (= (and start!82556 res!643397) b!961568))

(assert (= (and b!961568 res!643396) b!961573))

(assert (= (and b!961573 res!643398) b!961570))

(assert (= (and b!961570 res!643395) b!961576))

(assert (= (and b!961576 res!643399) b!961574))

(assert (= (and b!961574 res!643394) b!961575))

(assert (= (and b!961571 condMapEmpty!34030) mapIsEmpty!34030))

(assert (= (and b!961571 (not condMapEmpty!34030)) mapNonEmpty!34030))

(get-info :version)

(assert (= (and mapNonEmpty!34030 ((_ is ValueCellFull!10202) mapValue!34030)) b!961572))

(assert (= (and b!961571 ((_ is ValueCellFull!10202) mapDefault!34030)) b!961569))

(assert (= start!82556 b!961571))

(declare-fun m!892143 () Bool)

(assert (=> b!961570 m!892143))

(declare-fun m!892145 () Bool)

(assert (=> b!961575 m!892145))

(declare-fun m!892147 () Bool)

(assert (=> b!961575 m!892147))

(assert (=> b!961575 m!892145))

(assert (=> b!961575 m!892147))

(declare-fun m!892149 () Bool)

(assert (=> b!961575 m!892149))

(assert (=> b!961574 m!892147))

(assert (=> b!961574 m!892147))

(declare-fun m!892151 () Bool)

(assert (=> b!961574 m!892151))

(declare-fun m!892153 () Bool)

(assert (=> b!961573 m!892153))

(declare-fun m!892155 () Bool)

(assert (=> start!82556 m!892155))

(declare-fun m!892157 () Bool)

(assert (=> start!82556 m!892157))

(declare-fun m!892159 () Bool)

(assert (=> start!82556 m!892159))

(declare-fun m!892161 () Bool)

(assert (=> mapNonEmpty!34030 m!892161))

(check-sat (not b!961570) (not mapNonEmpty!34030) (not b!961574) (not b!961573) (not start!82556) tp_is_empty!21367 (not b_next!18655) (not b!961575) b_and!30153)
(check-sat b_and!30153 (not b_next!18655))
