; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37732 () Bool)

(assert start!37732)

(declare-fun b_free!8835 () Bool)

(declare-fun b_next!8835 () Bool)

(assert (=> start!37732 (= b_free!8835 (not b_next!8835))))

(declare-fun tp!31256 () Bool)

(declare-fun b_and!16077 () Bool)

(assert (=> start!37732 (= tp!31256 b_and!16077)))

(declare-fun b!386987 () Bool)

(declare-fun e!234683 () Bool)

(declare-fun e!234681 () Bool)

(declare-fun mapRes!15825 () Bool)

(assert (=> b!386987 (= e!234683 (and e!234681 mapRes!15825))))

(declare-fun condMapEmpty!15825 () Bool)

(declare-datatypes ((V!13781 0))(
  ( (V!13782 (val!4798 Int)) )
))
(declare-datatypes ((ValueCell!4410 0))(
  ( (ValueCellFull!4410 (v!6995 V!13781)) (EmptyCell!4410) )
))
(declare-datatypes ((array!22907 0))(
  ( (array!22908 (arr!10922 (Array (_ BitVec 32) ValueCell!4410)) (size!11274 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22907)

(declare-fun mapDefault!15825 () ValueCell!4410)

(assert (=> b!386987 (= condMapEmpty!15825 (= (arr!10922 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4410)) mapDefault!15825)))))

(declare-fun b!386988 () Bool)

(declare-fun e!234684 () Bool)

(declare-fun e!234682 () Bool)

(assert (=> b!386988 (= e!234684 e!234682)))

(declare-fun res!221027 () Bool)

(assert (=> b!386988 (=> (not res!221027) (not e!234682))))

(declare-datatypes ((array!22909 0))(
  ( (array!22910 (arr!10923 (Array (_ BitVec 32) (_ BitVec 64))) (size!11275 (_ BitVec 32))) )
))
(declare-fun lt!181934 () array!22909)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22909 (_ BitVec 32)) Bool)

(assert (=> b!386988 (= res!221027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181934 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22909)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!386988 (= lt!181934 (array!22910 (store (arr!10923 _keys!658) i!548 k0!778) (size!11275 _keys!658)))))

(declare-fun b!386989 () Bool)

(assert (=> b!386989 (= e!234682 false)))

(declare-datatypes ((tuple2!6450 0))(
  ( (tuple2!6451 (_1!3236 (_ BitVec 64)) (_2!3236 V!13781)) )
))
(declare-datatypes ((List!6299 0))(
  ( (Nil!6296) (Cons!6295 (h!7151 tuple2!6450) (t!11449 List!6299)) )
))
(declare-datatypes ((ListLongMap!5363 0))(
  ( (ListLongMap!5364 (toList!2697 List!6299)) )
))
(declare-fun lt!181935 () ListLongMap!5363)

(declare-fun defaultEntry!514 () Int)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13781)

(declare-fun zeroValue!472 () V!13781)

(declare-fun minValue!472 () V!13781)

(declare-fun getCurrentListMapNoExtraKeys!926 (array!22909 array!22907 (_ BitVec 32) (_ BitVec 32) V!13781 V!13781 (_ BitVec 32) Int) ListLongMap!5363)

(assert (=> b!386989 (= lt!181935 (getCurrentListMapNoExtraKeys!926 lt!181934 (array!22908 (store (arr!10922 _values!506) i!548 (ValueCellFull!4410 v!373)) (size!11274 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181933 () ListLongMap!5363)

(assert (=> b!386989 (= lt!181933 (getCurrentListMapNoExtraKeys!926 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!386990 () Bool)

(declare-fun res!221033 () Bool)

(assert (=> b!386990 (=> (not res!221033) (not e!234684))))

(assert (=> b!386990 (= res!221033 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11275 _keys!658))))))

(declare-fun b!386991 () Bool)

(declare-fun res!221034 () Bool)

(assert (=> b!386991 (=> (not res!221034) (not e!234684))))

(assert (=> b!386991 (= res!221034 (or (= (select (arr!10923 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10923 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!221036 () Bool)

(assert (=> start!37732 (=> (not res!221036) (not e!234684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37732 (= res!221036 (validMask!0 mask!970))))

(assert (=> start!37732 e!234684))

(declare-fun array_inv!8036 (array!22907) Bool)

(assert (=> start!37732 (and (array_inv!8036 _values!506) e!234683)))

(assert (=> start!37732 tp!31256))

(assert (=> start!37732 true))

(declare-fun tp_is_empty!9507 () Bool)

(assert (=> start!37732 tp_is_empty!9507))

(declare-fun array_inv!8037 (array!22909) Bool)

(assert (=> start!37732 (array_inv!8037 _keys!658)))

(declare-fun b!386992 () Bool)

(declare-fun res!221035 () Bool)

(assert (=> b!386992 (=> (not res!221035) (not e!234684))))

(declare-datatypes ((List!6300 0))(
  ( (Nil!6297) (Cons!6296 (h!7152 (_ BitVec 64)) (t!11450 List!6300)) )
))
(declare-fun arrayNoDuplicates!0 (array!22909 (_ BitVec 32) List!6300) Bool)

(assert (=> b!386992 (= res!221035 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6297))))

(declare-fun b!386993 () Bool)

(declare-fun e!234685 () Bool)

(assert (=> b!386993 (= e!234685 tp_is_empty!9507)))

(declare-fun mapIsEmpty!15825 () Bool)

(assert (=> mapIsEmpty!15825 mapRes!15825))

(declare-fun mapNonEmpty!15825 () Bool)

(declare-fun tp!31257 () Bool)

(assert (=> mapNonEmpty!15825 (= mapRes!15825 (and tp!31257 e!234685))))

(declare-fun mapRest!15825 () (Array (_ BitVec 32) ValueCell!4410))

(declare-fun mapKey!15825 () (_ BitVec 32))

(declare-fun mapValue!15825 () ValueCell!4410)

(assert (=> mapNonEmpty!15825 (= (arr!10922 _values!506) (store mapRest!15825 mapKey!15825 mapValue!15825))))

(declare-fun b!386994 () Bool)

(declare-fun res!221028 () Bool)

(assert (=> b!386994 (=> (not res!221028) (not e!234682))))

(assert (=> b!386994 (= res!221028 (arrayNoDuplicates!0 lt!181934 #b00000000000000000000000000000000 Nil!6297))))

(declare-fun b!386995 () Bool)

(declare-fun res!221031 () Bool)

(assert (=> b!386995 (=> (not res!221031) (not e!234684))))

(assert (=> b!386995 (= res!221031 (and (= (size!11274 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11275 _keys!658) (size!11274 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!386996 () Bool)

(declare-fun res!221029 () Bool)

(assert (=> b!386996 (=> (not res!221029) (not e!234684))))

(declare-fun arrayContainsKey!0 (array!22909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!386996 (= res!221029 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!386997 () Bool)

(assert (=> b!386997 (= e!234681 tp_is_empty!9507)))

(declare-fun b!386998 () Bool)

(declare-fun res!221030 () Bool)

(assert (=> b!386998 (=> (not res!221030) (not e!234684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!386998 (= res!221030 (validKeyInArray!0 k0!778))))

(declare-fun b!386999 () Bool)

(declare-fun res!221032 () Bool)

(assert (=> b!386999 (=> (not res!221032) (not e!234684))))

(assert (=> b!386999 (= res!221032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37732 res!221036) b!386995))

(assert (= (and b!386995 res!221031) b!386999))

(assert (= (and b!386999 res!221032) b!386992))

(assert (= (and b!386992 res!221035) b!386990))

(assert (= (and b!386990 res!221033) b!386998))

(assert (= (and b!386998 res!221030) b!386991))

(assert (= (and b!386991 res!221034) b!386996))

(assert (= (and b!386996 res!221029) b!386988))

(assert (= (and b!386988 res!221027) b!386994))

(assert (= (and b!386994 res!221028) b!386989))

(assert (= (and b!386987 condMapEmpty!15825) mapIsEmpty!15825))

(assert (= (and b!386987 (not condMapEmpty!15825)) mapNonEmpty!15825))

(get-info :version)

(assert (= (and mapNonEmpty!15825 ((_ is ValueCellFull!4410) mapValue!15825)) b!386993))

(assert (= (and b!386987 ((_ is ValueCellFull!4410) mapDefault!15825)) b!386997))

(assert (= start!37732 b!386987))

(declare-fun m!383205 () Bool)

(assert (=> b!386996 m!383205))

(declare-fun m!383207 () Bool)

(assert (=> b!386998 m!383207))

(declare-fun m!383209 () Bool)

(assert (=> b!386989 m!383209))

(declare-fun m!383211 () Bool)

(assert (=> b!386989 m!383211))

(declare-fun m!383213 () Bool)

(assert (=> b!386989 m!383213))

(declare-fun m!383215 () Bool)

(assert (=> b!386999 m!383215))

(declare-fun m!383217 () Bool)

(assert (=> b!386992 m!383217))

(declare-fun m!383219 () Bool)

(assert (=> mapNonEmpty!15825 m!383219))

(declare-fun m!383221 () Bool)

(assert (=> start!37732 m!383221))

(declare-fun m!383223 () Bool)

(assert (=> start!37732 m!383223))

(declare-fun m!383225 () Bool)

(assert (=> start!37732 m!383225))

(declare-fun m!383227 () Bool)

(assert (=> b!386994 m!383227))

(declare-fun m!383229 () Bool)

(assert (=> b!386991 m!383229))

(declare-fun m!383231 () Bool)

(assert (=> b!386988 m!383231))

(declare-fun m!383233 () Bool)

(assert (=> b!386988 m!383233))

(check-sat (not b!386994) tp_is_empty!9507 (not b!386988) (not b!386996) (not b!386998) (not b!386992) (not b!386999) (not b!386989) (not mapNonEmpty!15825) b_and!16077 (not b_next!8835) (not start!37732))
(check-sat b_and!16077 (not b_next!8835))
