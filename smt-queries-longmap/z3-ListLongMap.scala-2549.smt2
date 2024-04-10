; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39114 () Bool)

(assert start!39114)

(declare-fun b_free!9381 () Bool)

(declare-fun b_next!9381 () Bool)

(assert (=> start!39114 (= b_free!9381 (not b_next!9381))))

(declare-fun tp!33672 () Bool)

(declare-fun b_and!16767 () Bool)

(assert (=> start!39114 (= tp!33672 b_and!16767)))

(declare-fun b!411177 () Bool)

(declare-fun e!246304 () Bool)

(assert (=> b!411177 (= e!246304 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15149 0))(
  ( (V!15150 (val!5311 Int)) )
))
(declare-fun minValue!515 () V!15149)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4923 0))(
  ( (ValueCellFull!4923 (v!7558 V!15149)) (EmptyCell!4923) )
))
(declare-datatypes ((array!24927 0))(
  ( (array!24928 (arr!11913 (Array (_ BitVec 32) ValueCell!4923)) (size!12265 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24927)

(declare-fun zeroValue!515 () V!15149)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24929 0))(
  ( (array!24930 (arr!11914 (Array (_ BitVec 32) (_ BitVec 64))) (size!12266 (_ BitVec 32))) )
))
(declare-fun lt!189230 () array!24929)

(declare-fun v!412 () V!15149)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!6888 0))(
  ( (tuple2!6889 (_1!3455 (_ BitVec 64)) (_2!3455 V!15149)) )
))
(declare-datatypes ((List!6913 0))(
  ( (Nil!6910) (Cons!6909 (h!7765 tuple2!6888) (t!12087 List!6913)) )
))
(declare-datatypes ((ListLongMap!5801 0))(
  ( (ListLongMap!5802 (toList!2916 List!6913)) )
))
(declare-fun lt!189228 () ListLongMap!5801)

(declare-fun getCurrentListMapNoExtraKeys!1124 (array!24929 array!24927 (_ BitVec 32) (_ BitVec 32) V!15149 V!15149 (_ BitVec 32) Int) ListLongMap!5801)

(assert (=> b!411177 (= lt!189228 (getCurrentListMapNoExtraKeys!1124 lt!189230 (array!24928 (store (arr!11913 _values!549) i!563 (ValueCellFull!4923 v!412)) (size!12265 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189229 () ListLongMap!5801)

(declare-fun _keys!709 () array!24929)

(assert (=> b!411177 (= lt!189229 (getCurrentListMapNoExtraKeys!1124 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411178 () Bool)

(declare-fun res!238490 () Bool)

(assert (=> b!411178 (=> (not res!238490) (not e!246304))))

(assert (=> b!411178 (= res!238490 (bvsle from!863 i!563))))

(declare-fun b!411179 () Bool)

(declare-fun res!238489 () Bool)

(declare-fun e!246303 () Bool)

(assert (=> b!411179 (=> (not res!238489) (not e!246303))))

(assert (=> b!411179 (= res!238489 (or (= (select (arr!11914 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11914 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411180 () Bool)

(declare-fun res!238491 () Bool)

(assert (=> b!411180 (=> (not res!238491) (not e!246303))))

(declare-datatypes ((List!6914 0))(
  ( (Nil!6911) (Cons!6910 (h!7766 (_ BitVec 64)) (t!12088 List!6914)) )
))
(declare-fun arrayNoDuplicates!0 (array!24929 (_ BitVec 32) List!6914) Bool)

(assert (=> b!411180 (= res!238491 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6911))))

(declare-fun b!411181 () Bool)

(declare-fun res!238482 () Bool)

(assert (=> b!411181 (=> (not res!238482) (not e!246303))))

(assert (=> b!411181 (= res!238482 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12266 _keys!709))))))

(declare-fun mapNonEmpty!17421 () Bool)

(declare-fun mapRes!17421 () Bool)

(declare-fun tp!33671 () Bool)

(declare-fun e!246302 () Bool)

(assert (=> mapNonEmpty!17421 (= mapRes!17421 (and tp!33671 e!246302))))

(declare-fun mapValue!17421 () ValueCell!4923)

(declare-fun mapKey!17421 () (_ BitVec 32))

(declare-fun mapRest!17421 () (Array (_ BitVec 32) ValueCell!4923))

(assert (=> mapNonEmpty!17421 (= (arr!11913 _values!549) (store mapRest!17421 mapKey!17421 mapValue!17421))))

(declare-fun b!411182 () Bool)

(declare-fun tp_is_empty!10533 () Bool)

(assert (=> b!411182 (= e!246302 tp_is_empty!10533)))

(declare-fun mapIsEmpty!17421 () Bool)

(assert (=> mapIsEmpty!17421 mapRes!17421))

(declare-fun b!411183 () Bool)

(assert (=> b!411183 (= e!246303 e!246304)))

(declare-fun res!238484 () Bool)

(assert (=> b!411183 (=> (not res!238484) (not e!246304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24929 (_ BitVec 32)) Bool)

(assert (=> b!411183 (= res!238484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189230 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!411183 (= lt!189230 (array!24930 (store (arr!11914 _keys!709) i!563 k0!794) (size!12266 _keys!709)))))

(declare-fun b!411184 () Bool)

(declare-fun res!238480 () Bool)

(assert (=> b!411184 (=> (not res!238480) (not e!246304))))

(assert (=> b!411184 (= res!238480 (arrayNoDuplicates!0 lt!189230 #b00000000000000000000000000000000 Nil!6911))))

(declare-fun res!238487 () Bool)

(assert (=> start!39114 (=> (not res!238487) (not e!246303))))

(assert (=> start!39114 (= res!238487 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12266 _keys!709))))))

(assert (=> start!39114 e!246303))

(assert (=> start!39114 tp_is_empty!10533))

(assert (=> start!39114 tp!33672))

(assert (=> start!39114 true))

(declare-fun e!246305 () Bool)

(declare-fun array_inv!8692 (array!24927) Bool)

(assert (=> start!39114 (and (array_inv!8692 _values!549) e!246305)))

(declare-fun array_inv!8693 (array!24929) Bool)

(assert (=> start!39114 (array_inv!8693 _keys!709)))

(declare-fun b!411185 () Bool)

(declare-fun e!246301 () Bool)

(assert (=> b!411185 (= e!246301 tp_is_empty!10533)))

(declare-fun b!411186 () Bool)

(declare-fun res!238486 () Bool)

(assert (=> b!411186 (=> (not res!238486) (not e!246303))))

(assert (=> b!411186 (= res!238486 (and (= (size!12265 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12266 _keys!709) (size!12265 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411187 () Bool)

(declare-fun res!238481 () Bool)

(assert (=> b!411187 (=> (not res!238481) (not e!246303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411187 (= res!238481 (validMask!0 mask!1025))))

(declare-fun b!411188 () Bool)

(assert (=> b!411188 (= e!246305 (and e!246301 mapRes!17421))))

(declare-fun condMapEmpty!17421 () Bool)

(declare-fun mapDefault!17421 () ValueCell!4923)

(assert (=> b!411188 (= condMapEmpty!17421 (= (arr!11913 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4923)) mapDefault!17421)))))

(declare-fun b!411189 () Bool)

(declare-fun res!238488 () Bool)

(assert (=> b!411189 (=> (not res!238488) (not e!246303))))

(declare-fun arrayContainsKey!0 (array!24929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411189 (= res!238488 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411190 () Bool)

(declare-fun res!238485 () Bool)

(assert (=> b!411190 (=> (not res!238485) (not e!246303))))

(assert (=> b!411190 (= res!238485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411191 () Bool)

(declare-fun res!238483 () Bool)

(assert (=> b!411191 (=> (not res!238483) (not e!246303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411191 (= res!238483 (validKeyInArray!0 k0!794))))

(assert (= (and start!39114 res!238487) b!411187))

(assert (= (and b!411187 res!238481) b!411186))

(assert (= (and b!411186 res!238486) b!411190))

(assert (= (and b!411190 res!238485) b!411180))

(assert (= (and b!411180 res!238491) b!411181))

(assert (= (and b!411181 res!238482) b!411191))

(assert (= (and b!411191 res!238483) b!411179))

(assert (= (and b!411179 res!238489) b!411189))

(assert (= (and b!411189 res!238488) b!411183))

(assert (= (and b!411183 res!238484) b!411184))

(assert (= (and b!411184 res!238480) b!411178))

(assert (= (and b!411178 res!238490) b!411177))

(assert (= (and b!411188 condMapEmpty!17421) mapIsEmpty!17421))

(assert (= (and b!411188 (not condMapEmpty!17421)) mapNonEmpty!17421))

(get-info :version)

(assert (= (and mapNonEmpty!17421 ((_ is ValueCellFull!4923) mapValue!17421)) b!411182))

(assert (= (and b!411188 ((_ is ValueCellFull!4923) mapDefault!17421)) b!411185))

(assert (= start!39114 b!411188))

(declare-fun m!401413 () Bool)

(assert (=> b!411183 m!401413))

(declare-fun m!401415 () Bool)

(assert (=> b!411183 m!401415))

(declare-fun m!401417 () Bool)

(assert (=> mapNonEmpty!17421 m!401417))

(declare-fun m!401419 () Bool)

(assert (=> b!411191 m!401419))

(declare-fun m!401421 () Bool)

(assert (=> b!411190 m!401421))

(declare-fun m!401423 () Bool)

(assert (=> b!411184 m!401423))

(declare-fun m!401425 () Bool)

(assert (=> b!411187 m!401425))

(declare-fun m!401427 () Bool)

(assert (=> b!411177 m!401427))

(declare-fun m!401429 () Bool)

(assert (=> b!411177 m!401429))

(declare-fun m!401431 () Bool)

(assert (=> b!411177 m!401431))

(declare-fun m!401433 () Bool)

(assert (=> start!39114 m!401433))

(declare-fun m!401435 () Bool)

(assert (=> start!39114 m!401435))

(declare-fun m!401437 () Bool)

(assert (=> b!411180 m!401437))

(declare-fun m!401439 () Bool)

(assert (=> b!411189 m!401439))

(declare-fun m!401441 () Bool)

(assert (=> b!411179 m!401441))

(check-sat (not b!411177) (not mapNonEmpty!17421) (not b!411180) (not b!411183) (not b_next!9381) (not b!411184) (not b!411190) (not b!411187) (not b!411191) (not b!411189) tp_is_empty!10533 b_and!16767 (not start!39114))
(check-sat b_and!16767 (not b_next!9381))
