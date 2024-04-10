; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38772 () Bool)

(assert start!38772)

(declare-fun b!404246 () Bool)

(declare-fun res!233095 () Bool)

(declare-fun e!243223 () Bool)

(assert (=> b!404246 (=> (not res!233095) (not e!243223))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24277 0))(
  ( (array!24278 (arr!11588 (Array (_ BitVec 32) (_ BitVec 64))) (size!11940 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24277)

(assert (=> b!404246 (= res!233095 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11940 _keys!709))))))

(declare-fun res!233093 () Bool)

(assert (=> start!38772 (=> (not res!233093) (not e!243223))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38772 (= res!233093 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11940 _keys!709))))))

(assert (=> start!38772 e!243223))

(assert (=> start!38772 true))

(declare-datatypes ((V!14693 0))(
  ( (V!14694 (val!5140 Int)) )
))
(declare-datatypes ((ValueCell!4752 0))(
  ( (ValueCellFull!4752 (v!7387 V!14693)) (EmptyCell!4752) )
))
(declare-datatypes ((array!24279 0))(
  ( (array!24280 (arr!11589 (Array (_ BitVec 32) ValueCell!4752)) (size!11941 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24279)

(declare-fun e!243227 () Bool)

(declare-fun array_inv!8476 (array!24279) Bool)

(assert (=> start!38772 (and (array_inv!8476 _values!549) e!243227)))

(declare-fun array_inv!8477 (array!24277) Bool)

(assert (=> start!38772 (array_inv!8477 _keys!709)))

(declare-fun mapNonEmpty!16908 () Bool)

(declare-fun mapRes!16908 () Bool)

(declare-fun tp!33027 () Bool)

(declare-fun e!243224 () Bool)

(assert (=> mapNonEmpty!16908 (= mapRes!16908 (and tp!33027 e!243224))))

(declare-fun mapValue!16908 () ValueCell!4752)

(declare-fun mapKey!16908 () (_ BitVec 32))

(declare-fun mapRest!16908 () (Array (_ BitVec 32) ValueCell!4752))

(assert (=> mapNonEmpty!16908 (= (arr!11589 _values!549) (store mapRest!16908 mapKey!16908 mapValue!16908))))

(declare-fun b!404247 () Bool)

(declare-fun res!233088 () Bool)

(assert (=> b!404247 (=> (not res!233088) (not e!243223))))

(assert (=> b!404247 (= res!233088 (or (= (select (arr!11588 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11588 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404248 () Bool)

(declare-fun res!233096 () Bool)

(assert (=> b!404248 (=> (not res!233096) (not e!243223))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404248 (= res!233096 (validKeyInArray!0 k0!794))))

(declare-fun b!404249 () Bool)

(declare-fun e!243225 () Bool)

(assert (=> b!404249 (= e!243227 (and e!243225 mapRes!16908))))

(declare-fun condMapEmpty!16908 () Bool)

(declare-fun mapDefault!16908 () ValueCell!4752)

(assert (=> b!404249 (= condMapEmpty!16908 (= (arr!11589 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4752)) mapDefault!16908)))))

(declare-fun b!404250 () Bool)

(declare-fun tp_is_empty!10191 () Bool)

(assert (=> b!404250 (= e!243225 tp_is_empty!10191)))

(declare-fun b!404251 () Bool)

(declare-fun res!233090 () Bool)

(assert (=> b!404251 (=> (not res!233090) (not e!243223))))

(declare-fun arrayContainsKey!0 (array!24277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404251 (= res!233090 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404252 () Bool)

(declare-fun res!233089 () Bool)

(assert (=> b!404252 (=> (not res!233089) (not e!243223))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404252 (= res!233089 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16908 () Bool)

(assert (=> mapIsEmpty!16908 mapRes!16908))

(declare-fun b!404253 () Bool)

(assert (=> b!404253 (= e!243224 tp_is_empty!10191)))

(declare-fun b!404254 () Bool)

(declare-fun res!233091 () Bool)

(assert (=> b!404254 (=> (not res!233091) (not e!243223))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404254 (= res!233091 (and (= (size!11941 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11940 _keys!709) (size!11941 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404255 () Bool)

(declare-fun res!233094 () Bool)

(assert (=> b!404255 (=> (not res!233094) (not e!243223))))

(declare-datatypes ((List!6749 0))(
  ( (Nil!6746) (Cons!6745 (h!7601 (_ BitVec 64)) (t!11923 List!6749)) )
))
(declare-fun arrayNoDuplicates!0 (array!24277 (_ BitVec 32) List!6749) Bool)

(assert (=> b!404255 (= res!233094 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6746))))

(declare-fun b!404256 () Bool)

(declare-fun e!243228 () Bool)

(assert (=> b!404256 (= e!243223 e!243228)))

(declare-fun res!233097 () Bool)

(assert (=> b!404256 (=> (not res!233097) (not e!243228))))

(declare-fun lt!188153 () array!24277)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24277 (_ BitVec 32)) Bool)

(assert (=> b!404256 (= res!233097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188153 mask!1025))))

(assert (=> b!404256 (= lt!188153 (array!24278 (store (arr!11588 _keys!709) i!563 k0!794) (size!11940 _keys!709)))))

(declare-fun b!404257 () Bool)

(declare-fun res!233092 () Bool)

(assert (=> b!404257 (=> (not res!233092) (not e!243223))))

(assert (=> b!404257 (= res!233092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404258 () Bool)

(assert (=> b!404258 (= e!243228 false)))

(declare-fun lt!188152 () Bool)

(assert (=> b!404258 (= lt!188152 (arrayNoDuplicates!0 lt!188153 #b00000000000000000000000000000000 Nil!6746))))

(assert (= (and start!38772 res!233093) b!404252))

(assert (= (and b!404252 res!233089) b!404254))

(assert (= (and b!404254 res!233091) b!404257))

(assert (= (and b!404257 res!233092) b!404255))

(assert (= (and b!404255 res!233094) b!404246))

(assert (= (and b!404246 res!233095) b!404248))

(assert (= (and b!404248 res!233096) b!404247))

(assert (= (and b!404247 res!233088) b!404251))

(assert (= (and b!404251 res!233090) b!404256))

(assert (= (and b!404256 res!233097) b!404258))

(assert (= (and b!404249 condMapEmpty!16908) mapIsEmpty!16908))

(assert (= (and b!404249 (not condMapEmpty!16908)) mapNonEmpty!16908))

(get-info :version)

(assert (= (and mapNonEmpty!16908 ((_ is ValueCellFull!4752) mapValue!16908)) b!404253))

(assert (= (and b!404249 ((_ is ValueCellFull!4752) mapDefault!16908)) b!404250))

(assert (= start!38772 b!404249))

(declare-fun m!397159 () Bool)

(assert (=> b!404255 m!397159))

(declare-fun m!397161 () Bool)

(assert (=> b!404257 m!397161))

(declare-fun m!397163 () Bool)

(assert (=> b!404251 m!397163))

(declare-fun m!397165 () Bool)

(assert (=> b!404247 m!397165))

(declare-fun m!397167 () Bool)

(assert (=> b!404248 m!397167))

(declare-fun m!397169 () Bool)

(assert (=> b!404252 m!397169))

(declare-fun m!397171 () Bool)

(assert (=> b!404258 m!397171))

(declare-fun m!397173 () Bool)

(assert (=> start!38772 m!397173))

(declare-fun m!397175 () Bool)

(assert (=> start!38772 m!397175))

(declare-fun m!397177 () Bool)

(assert (=> mapNonEmpty!16908 m!397177))

(declare-fun m!397179 () Bool)

(assert (=> b!404256 m!397179))

(declare-fun m!397181 () Bool)

(assert (=> b!404256 m!397181))

(check-sat tp_is_empty!10191 (not b!404251) (not start!38772) (not b!404252) (not b!404256) (not b!404255) (not mapNonEmpty!16908) (not b!404258) (not b!404248) (not b!404257))
(check-sat)
