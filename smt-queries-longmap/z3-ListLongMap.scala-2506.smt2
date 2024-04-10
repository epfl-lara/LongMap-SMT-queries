; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38856 () Bool)

(assert start!38856)

(declare-fun b!405884 () Bool)

(declare-fun e!243980 () Bool)

(declare-fun e!243983 () Bool)

(assert (=> b!405884 (= e!243980 e!243983)))

(declare-fun res!234349 () Bool)

(assert (=> b!405884 (=> (not res!234349) (not e!243983))))

(declare-datatypes ((array!24441 0))(
  ( (array!24442 (arr!11670 (Array (_ BitVec 32) (_ BitVec 64))) (size!12022 (_ BitVec 32))) )
))
(declare-fun lt!188404 () array!24441)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24441 (_ BitVec 32)) Bool)

(assert (=> b!405884 (= res!234349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188404 mask!1025))))

(declare-fun _keys!709 () array!24441)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405884 (= lt!188404 (array!24442 (store (arr!11670 _keys!709) i!563 k0!794) (size!12022 _keys!709)))))

(declare-fun b!405885 () Bool)

(declare-fun res!234351 () Bool)

(assert (=> b!405885 (=> (not res!234351) (not e!243980))))

(declare-fun arrayContainsKey!0 (array!24441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405885 (= res!234351 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405886 () Bool)

(declare-fun res!234357 () Bool)

(assert (=> b!405886 (=> (not res!234357) (not e!243980))))

(declare-datatypes ((List!6782 0))(
  ( (Nil!6779) (Cons!6778 (h!7634 (_ BitVec 64)) (t!11956 List!6782)) )
))
(declare-fun arrayNoDuplicates!0 (array!24441 (_ BitVec 32) List!6782) Bool)

(assert (=> b!405886 (= res!234357 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6779))))

(declare-fun mapIsEmpty!17034 () Bool)

(declare-fun mapRes!17034 () Bool)

(assert (=> mapIsEmpty!17034 mapRes!17034))

(declare-fun b!405887 () Bool)

(declare-fun res!234348 () Bool)

(assert (=> b!405887 (=> (not res!234348) (not e!243980))))

(assert (=> b!405887 (= res!234348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405888 () Bool)

(assert (=> b!405888 (= e!243983 false)))

(declare-fun lt!188405 () Bool)

(assert (=> b!405888 (= lt!188405 (arrayNoDuplicates!0 lt!188404 #b00000000000000000000000000000000 Nil!6779))))

(declare-fun res!234355 () Bool)

(assert (=> start!38856 (=> (not res!234355) (not e!243980))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38856 (= res!234355 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12022 _keys!709))))))

(assert (=> start!38856 e!243980))

(assert (=> start!38856 true))

(declare-datatypes ((V!14805 0))(
  ( (V!14806 (val!5182 Int)) )
))
(declare-datatypes ((ValueCell!4794 0))(
  ( (ValueCellFull!4794 (v!7429 V!14805)) (EmptyCell!4794) )
))
(declare-datatypes ((array!24443 0))(
  ( (array!24444 (arr!11671 (Array (_ BitVec 32) ValueCell!4794)) (size!12023 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24443)

(declare-fun e!243984 () Bool)

(declare-fun array_inv!8526 (array!24443) Bool)

(assert (=> start!38856 (and (array_inv!8526 _values!549) e!243984)))

(declare-fun array_inv!8527 (array!24441) Bool)

(assert (=> start!38856 (array_inv!8527 _keys!709)))

(declare-fun b!405889 () Bool)

(declare-fun res!234352 () Bool)

(assert (=> b!405889 (=> (not res!234352) (not e!243980))))

(assert (=> b!405889 (= res!234352 (or (= (select (arr!11670 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11670 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405890 () Bool)

(declare-fun e!243981 () Bool)

(declare-fun tp_is_empty!10275 () Bool)

(assert (=> b!405890 (= e!243981 tp_is_empty!10275)))

(declare-fun b!405891 () Bool)

(declare-fun e!243979 () Bool)

(assert (=> b!405891 (= e!243979 tp_is_empty!10275)))

(declare-fun b!405892 () Bool)

(assert (=> b!405892 (= e!243984 (and e!243981 mapRes!17034))))

(declare-fun condMapEmpty!17034 () Bool)

(declare-fun mapDefault!17034 () ValueCell!4794)

(assert (=> b!405892 (= condMapEmpty!17034 (= (arr!11671 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4794)) mapDefault!17034)))))

(declare-fun b!405893 () Bool)

(declare-fun res!234356 () Bool)

(assert (=> b!405893 (=> (not res!234356) (not e!243980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405893 (= res!234356 (validMask!0 mask!1025))))

(declare-fun b!405894 () Bool)

(declare-fun res!234350 () Bool)

(assert (=> b!405894 (=> (not res!234350) (not e!243980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405894 (= res!234350 (validKeyInArray!0 k0!794))))

(declare-fun b!405895 () Bool)

(declare-fun res!234353 () Bool)

(assert (=> b!405895 (=> (not res!234353) (not e!243980))))

(assert (=> b!405895 (= res!234353 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12022 _keys!709))))))

(declare-fun mapNonEmpty!17034 () Bool)

(declare-fun tp!33153 () Bool)

(assert (=> mapNonEmpty!17034 (= mapRes!17034 (and tp!33153 e!243979))))

(declare-fun mapKey!17034 () (_ BitVec 32))

(declare-fun mapRest!17034 () (Array (_ BitVec 32) ValueCell!4794))

(declare-fun mapValue!17034 () ValueCell!4794)

(assert (=> mapNonEmpty!17034 (= (arr!11671 _values!549) (store mapRest!17034 mapKey!17034 mapValue!17034))))

(declare-fun b!405896 () Bool)

(declare-fun res!234354 () Bool)

(assert (=> b!405896 (=> (not res!234354) (not e!243980))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405896 (= res!234354 (and (= (size!12023 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12022 _keys!709) (size!12023 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38856 res!234355) b!405893))

(assert (= (and b!405893 res!234356) b!405896))

(assert (= (and b!405896 res!234354) b!405887))

(assert (= (and b!405887 res!234348) b!405886))

(assert (= (and b!405886 res!234357) b!405895))

(assert (= (and b!405895 res!234353) b!405894))

(assert (= (and b!405894 res!234350) b!405889))

(assert (= (and b!405889 res!234352) b!405885))

(assert (= (and b!405885 res!234351) b!405884))

(assert (= (and b!405884 res!234349) b!405888))

(assert (= (and b!405892 condMapEmpty!17034) mapIsEmpty!17034))

(assert (= (and b!405892 (not condMapEmpty!17034)) mapNonEmpty!17034))

(get-info :version)

(assert (= (and mapNonEmpty!17034 ((_ is ValueCellFull!4794) mapValue!17034)) b!405891))

(assert (= (and b!405892 ((_ is ValueCellFull!4794) mapDefault!17034)) b!405890))

(assert (= start!38856 b!405892))

(declare-fun m!398167 () Bool)

(assert (=> b!405894 m!398167))

(declare-fun m!398169 () Bool)

(assert (=> b!405889 m!398169))

(declare-fun m!398171 () Bool)

(assert (=> b!405886 m!398171))

(declare-fun m!398173 () Bool)

(assert (=> b!405888 m!398173))

(declare-fun m!398175 () Bool)

(assert (=> b!405887 m!398175))

(declare-fun m!398177 () Bool)

(assert (=> b!405885 m!398177))

(declare-fun m!398179 () Bool)

(assert (=> mapNonEmpty!17034 m!398179))

(declare-fun m!398181 () Bool)

(assert (=> start!38856 m!398181))

(declare-fun m!398183 () Bool)

(assert (=> start!38856 m!398183))

(declare-fun m!398185 () Bool)

(assert (=> b!405893 m!398185))

(declare-fun m!398187 () Bool)

(assert (=> b!405884 m!398187))

(declare-fun m!398189 () Bool)

(assert (=> b!405884 m!398189))

(check-sat (not b!405884) (not start!38856) (not b!405894) tp_is_empty!10275 (not b!405893) (not b!405887) (not mapNonEmpty!17034) (not b!405885) (not b!405886) (not b!405888))
(check-sat)
