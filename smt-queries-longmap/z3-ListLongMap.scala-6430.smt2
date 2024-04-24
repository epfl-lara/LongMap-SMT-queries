; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82544 () Bool)

(assert start!82544)

(declare-fun b_free!18643 () Bool)

(declare-fun b_next!18643 () Bool)

(assert (=> start!82544 (= b_free!18643 (not b_next!18643))))

(declare-fun tp!64900 () Bool)

(declare-fun b_and!30141 () Bool)

(assert (=> start!82544 (= tp!64900 b_and!30141)))

(declare-fun mapIsEmpty!34012 () Bool)

(declare-fun mapRes!34012 () Bool)

(assert (=> mapIsEmpty!34012 mapRes!34012))

(declare-fun b!961406 () Bool)

(declare-fun e!542021 () Bool)

(declare-fun tp_is_empty!21355 () Bool)

(assert (=> b!961406 (= e!542021 tp_is_empty!21355)))

(declare-fun b!961407 () Bool)

(declare-fun res!643286 () Bool)

(declare-fun e!542020 () Bool)

(assert (=> b!961407 (=> (not res!643286) (not e!542020))))

(declare-datatypes ((array!58832 0))(
  ( (array!58833 (arr!28285 (Array (_ BitVec 32) (_ BitVec 64))) (size!28765 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58832)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58832 (_ BitVec 32)) Bool)

(assert (=> b!961407 (= res!643286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!961408 () Bool)

(declare-fun res!643290 () Bool)

(assert (=> b!961408 (=> (not res!643290) (not e!542020))))

(declare-datatypes ((List!19645 0))(
  ( (Nil!19642) (Cons!19641 (h!20809 (_ BitVec 64)) (t!28000 List!19645)) )
))
(declare-fun arrayNoDuplicates!0 (array!58832 (_ BitVec 32) List!19645) Bool)

(assert (=> b!961408 (= res!643290 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19642))))

(declare-fun b!961409 () Bool)

(declare-fun res!643287 () Bool)

(assert (=> b!961409 (=> (not res!643287) (not e!542020))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33457 0))(
  ( (V!33458 (val!10728 Int)) )
))
(declare-datatypes ((ValueCell!10196 0))(
  ( (ValueCellFull!10196 (v!13282 V!33457)) (EmptyCell!10196) )
))
(declare-datatypes ((array!58834 0))(
  ( (array!58835 (arr!28286 (Array (_ BitVec 32) ValueCell!10196)) (size!28766 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58834)

(assert (=> b!961409 (= res!643287 (and (= (size!28766 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28765 _keys!1668) (size!28766 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!961410 () Bool)

(declare-fun res!643289 () Bool)

(assert (=> b!961410 (=> (not res!643289) (not e!542020))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961410 (= res!643289 (validKeyInArray!0 (select (arr!28285 _keys!1668) i!793)))))

(declare-fun b!961411 () Bool)

(assert (=> b!961411 (= e!542020 false)))

(declare-fun lt!431017 () Bool)

(declare-fun minValue!1328 () V!33457)

(declare-fun zeroValue!1328 () V!33457)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-datatypes ((tuple2!13814 0))(
  ( (tuple2!13815 (_1!6918 (_ BitVec 64)) (_2!6918 V!33457)) )
))
(declare-datatypes ((List!19646 0))(
  ( (Nil!19643) (Cons!19642 (h!20810 tuple2!13814) (t!28001 List!19646)) )
))
(declare-datatypes ((ListLongMap!12513 0))(
  ( (ListLongMap!12514 (toList!6272 List!19646)) )
))
(declare-fun contains!5384 (ListLongMap!12513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3505 (array!58832 array!58834 (_ BitVec 32) (_ BitVec 32) V!33457 V!33457 (_ BitVec 32) Int) ListLongMap!12513)

(assert (=> b!961411 (= lt!431017 (contains!5384 (getCurrentListMap!3505 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28285 _keys!1668) i!793)))))

(declare-fun b!961412 () Bool)

(declare-fun e!542019 () Bool)

(assert (=> b!961412 (= e!542019 tp_is_empty!21355)))

(declare-fun mapNonEmpty!34012 () Bool)

(declare-fun tp!64899 () Bool)

(assert (=> mapNonEmpty!34012 (= mapRes!34012 (and tp!64899 e!542021))))

(declare-fun mapValue!34012 () ValueCell!10196)

(declare-fun mapRest!34012 () (Array (_ BitVec 32) ValueCell!10196))

(declare-fun mapKey!34012 () (_ BitVec 32))

(assert (=> mapNonEmpty!34012 (= (arr!28286 _values!1386) (store mapRest!34012 mapKey!34012 mapValue!34012))))

(declare-fun b!961413 () Bool)

(declare-fun res!643288 () Bool)

(assert (=> b!961413 (=> (not res!643288) (not e!542020))))

(assert (=> b!961413 (= res!643288 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28765 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28765 _keys!1668))))))

(declare-fun b!961414 () Bool)

(declare-fun e!542018 () Bool)

(assert (=> b!961414 (= e!542018 (and e!542019 mapRes!34012))))

(declare-fun condMapEmpty!34012 () Bool)

(declare-fun mapDefault!34012 () ValueCell!10196)

(assert (=> b!961414 (= condMapEmpty!34012 (= (arr!28286 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10196)) mapDefault!34012)))))

(declare-fun res!643291 () Bool)

(assert (=> start!82544 (=> (not res!643291) (not e!542020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82544 (= res!643291 (validMask!0 mask!2088))))

(assert (=> start!82544 e!542020))

(assert (=> start!82544 true))

(assert (=> start!82544 tp_is_empty!21355))

(declare-fun array_inv!22003 (array!58832) Bool)

(assert (=> start!82544 (array_inv!22003 _keys!1668)))

(declare-fun array_inv!22004 (array!58834) Bool)

(assert (=> start!82544 (and (array_inv!22004 _values!1386) e!542018)))

(assert (=> start!82544 tp!64900))

(assert (= (and start!82544 res!643291) b!961409))

(assert (= (and b!961409 res!643287) b!961407))

(assert (= (and b!961407 res!643286) b!961408))

(assert (= (and b!961408 res!643290) b!961413))

(assert (= (and b!961413 res!643288) b!961410))

(assert (= (and b!961410 res!643289) b!961411))

(assert (= (and b!961414 condMapEmpty!34012) mapIsEmpty!34012))

(assert (= (and b!961414 (not condMapEmpty!34012)) mapNonEmpty!34012))

(get-info :version)

(assert (= (and mapNonEmpty!34012 ((_ is ValueCellFull!10196) mapValue!34012)) b!961406))

(assert (= (and b!961414 ((_ is ValueCellFull!10196) mapDefault!34012)) b!961412))

(assert (= start!82544 b!961414))

(declare-fun m!892023 () Bool)

(assert (=> b!961410 m!892023))

(assert (=> b!961410 m!892023))

(declare-fun m!892025 () Bool)

(assert (=> b!961410 m!892025))

(declare-fun m!892027 () Bool)

(assert (=> b!961407 m!892027))

(declare-fun m!892029 () Bool)

(assert (=> start!82544 m!892029))

(declare-fun m!892031 () Bool)

(assert (=> start!82544 m!892031))

(declare-fun m!892033 () Bool)

(assert (=> start!82544 m!892033))

(declare-fun m!892035 () Bool)

(assert (=> mapNonEmpty!34012 m!892035))

(declare-fun m!892037 () Bool)

(assert (=> b!961408 m!892037))

(declare-fun m!892039 () Bool)

(assert (=> b!961411 m!892039))

(assert (=> b!961411 m!892023))

(assert (=> b!961411 m!892039))

(assert (=> b!961411 m!892023))

(declare-fun m!892041 () Bool)

(assert (=> b!961411 m!892041))

(check-sat b_and!30141 tp_is_empty!21355 (not b!961411) (not b_next!18643) (not b!961408) (not start!82544) (not b!961410) (not mapNonEmpty!34012) (not b!961407))
(check-sat b_and!30141 (not b_next!18643))
